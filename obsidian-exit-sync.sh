#!/usr/bin/env bash
# obsidian-exit-sync.sh
# Запуск Obsidian и автоматический git add/commit/push при выходе.
# Отредактируйте блок CONFIG ниже перед использованием.

set -o pipefail
IFS=$'\n\t'

# === CONFIG ===
# Путь к vault (папка с .git и заметками)
VAULT_DIR="${VAULT_DIR:-$HOME/ObsidianVault}"    # <- измените на путь к вашему vault
# Команда для запуска Obsidian. Можно указать 'obsidian', полный путь к AppImage или другой исполняемый.
OBS_CMD="${OBS_CMD:-obsidian}"                  # <- измените, если в PATH нет команды obsidian
REMOTE="${REMOTE:-origin}"                      # имя remote
PULL_BEFORE_PUSH="${PULL_BEFORE_PUSH:-false}"   # true|false - подтягивать перед пушем
LOG_FILE="${LOG_FILE:-$VAULT_DIR/.obsidian/exit-sync.log}"
# === /CONFIG ===

mkdir -p "$(dirname "$LOG_FILE")"
touch "$LOG_FILE"

log() {
  echo "[$(date '+%F %T')] $*" | tee -a "$LOG_FILE"
}

# Проверки
if [ ! -d "$VAULT_DIR" ]; then
  log "ERROR: Vault directory not found: $VAULT_DIR"
  exit 1
fi

cd "$VAULT_DIR" || { log "ERROR: cannot cd to $VAULT_DIR"; exit 1; }

# Небольшая функция для выполнения git синка
do_git_sync() {
  # Убедимся, что это git-репозиторий
  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    log "INFO: папка не является git-репозиторием, пропускаю sync."
    return 0
  fi

  # Убедимся, что есть git user (warning, но не обязательна)
  if [ -z "$(git config user.name)" ] || [ -z "$(git config user.email)" ]; then
    log "WARNING: git user.name/email не настроены (см. git config --global user.name/email)"
  fi

  # Стадируем все изменения
  git add -A
  # Есть ли изменения для коммита?
  if git diff --cached --quiet --exit-code; then
    log "INFO: Изменений для коммита нет."
  else
    COMMIT_MSG="Auto backup on exit $(hostname) $(date '+%Y-%m-%d %H:%M:%S')"
    if git commit -m "$COMMIT_MSG"; then
      log "INFO: Успешный коммит: $COMMIT_MSG"
    else
      log "ERROR: git commit завершился с ошибкой."
    fi
  fi

  # Определяем текущую ветку
  BRANCH="$(git rev-parse --abbrev-ref HEAD 2>/dev/null || true)"
  if [ -z "$BRANCH" ]; then
    BRANCH="main"
    log "INFO: Не удалось определить ветку; использую '$BRANCH'."
  fi

  if [ "$PULL_BEFORE_PUSH" = "true" ]; then
    log "INFO: Pull before push enabled: git pull $REMOTE $BRANCH"
    if ! git pull --no-edit "$REMOTE" "$BRANCH"; then
      log "WARNING: git pull вернул ошибку (возможно конфликты). Прекращаю автоматический push."
      return 1
    fi
  fi

  # Push
  log "INFO: Пуш в $REMOTE/$BRANCH ..."
  if git push "$REMOTE" "$BRANCH"; then
    log "INFO: Push успешно."
    return 0
  else
    log "ERROR: Push не удался. Проверьте аутентификацию и наличие новых изменений в remote."
    return 1
  fi
}

# Сработает всегда при выходе (даже при ошибке), если процесс не убит сигналом SIGKILL
on_exit() {
  rc=$?
  log "INFO: Обнаружен выход wrapper (rc=$rc). Запускаю git sync..."
  do_git_sync || log "ERROR: Синхронизация завершилась с ошибкой."
}
trap on_exit EXIT

# Запуск Obsidian
log "INFO: Запускаю Obsidian командой: $OBS_CMD (vault: $VAULT_DIR)"
# Если команда содержит пробелы (например "flatpak run ..."), используем bash -c
if [[ "$OBS_CMD" == *" "* ]]; then
  bash -c "$OBS_CMD" &
  OBS_PID=$!
else
  if command -v "$OBS_CMD" >/dev/null 2>&1; then
    "$OBS_CMD" & OBS_PID=$!
  elif [ -x "$OBS_CMD" ]; then
    "$OBS_CMD" & OBS_PID=$!
  else
    log "ERROR: Obsidian executable '$OBS_CMD' не найден в PATH и не является исполняемым файлом."
    exit 1
  fi
fi

log "INFO: Obsidian запущен (PID $OBS_PID). Ожидаю завершения..."
# Ждём завершения процесса
wait "$OBS_PID" || true
# Когда процесс завершится — trap on_exit выполнит git-синхронизацию.
exit 0
