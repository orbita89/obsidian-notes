#!/usr/bin/env bash
set -e

echo "🔧 Сброс системных сочетаний клавиш GNOME..."
gsettings reset-recursively org.gnome.desktop.wm.keybindings || true
gsettings reset-recursively org.gnome.settings-daemon.plugins.media-keys || true

echo "⌨️ Настройка раскладки клавиатуры (EN + RU)..."
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'ru')]"
gsettings set org.gnome.desktop.input-sources xkb-options "['grp:win_space_toggle']"

echo "🧹 Очистка пользовательских Keymap PhpStorm..."
PHPS_DIRS=$(find ~/.config/JetBrains -maxdepth 1 -type d -name "PhpStorm*")

for dir in $PHPS_DIRS; do
  echo " - Очистка настроек в $dir"
  rm -rf "$dir/keymaps" || true
  rm -f "$dir/options/keymap.xml" || true
done

echo "🧰 Установка стандартного keymap PhpStorm (Default)..."
echo " - Это произойдет автоматически при следующем запуске PhpStorm"

echo "🔄 Сброс локальных xkb настроек (если были кастомные)..."
sudo rm -f /etc/default/keyboard
sudo dpkg-reconfigure -f noninteractive keyboard-configuration

echo "✅ Готово!"
echo ""
echo "🚀 Теперь перезайди в систему (logout/login или reboot)"
echo "После перезагрузки:"
echo "1. Запусти PhpStorm"
echo "2. Убедись, что выбран Keymap: Default"
echo "3. Проверь горячие клавиши на EN и RU — должны работать одинаково."


[Источник: /home/dev/.local/bin]
