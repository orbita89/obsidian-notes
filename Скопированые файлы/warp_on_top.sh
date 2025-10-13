#!/usr/bin/env bash
# warp-above-toggle.sh
# Toggle "поверх всех" для Warp. Устойчив к выходу из fullscreen.

WARP_CMD="warp-terminal"
WMCTRL="/usr/bin/wmctrl"
XPROP="/usr/bin/xprop"
PIDFILE="/tmp/warp_above_watcher_${USER}.pid"
SLEEP_INTERVAL=0.2

find_warp_win() {
    $WMCTRL -lx 2>/dev/null | grep -i "warp.Warp" | awk '{print $1}' | head -n1
}

set_above() {
    local win="$1"
    [ -n "$win" ] && $WMCTRL -i -r "$win" -b add,above 2>/dev/null || true
}

remove_above() {
    local win="$1"
    [ -n "$win" ] && $WMCTRL -i -r "$win" -b remove,above 2>/dev/null || true
}

# --- Toggle ---
if [ -f "$PIDFILE" ]; then
    PID=$(cat "$PIDFILE" 2>/dev/null)
    if [ -n "$PID" ] && kill -0 "$PID" 2>/dev/null; then
        WIN=$(find_warp_win)
        remove_above "$WIN"
        kill "$PID" 2>/dev/null || true
        rm -f "$PIDFILE"
        echo "Режим 'поверх всех' отключён."
        exit 0
    else
        rm -f "$PIDFILE"
    fi
fi

# Если окна нет — запускаем Warp
WARP_WIN=$(find_warp_win)
if [ -z "$WARP_WIN" ]; then
    GDK_BACKEND=x11 $WARP_CMD &>/dev/null &
    for i in {1..40}; do
        sleep 0.1
        WARP_WIN=$(find_warp_win)
        [ -n "$WARP_WIN" ] && break
    done
    [ -z "$WARP_WIN" ] && { echo "Не удалось найти окно Warp."; exit 1; }
fi

# Ставим флаг
set_above "$WARP_WIN"

# Watcher: периодически проверяет флаг
(
    while true; do
        sleep "$SLEEP_INTERVAL"
        WIN=$(find_warp_win)
        if [ -n "$WIN" ]; then
            STATE=$($XPROP -id "$WIN" _NET_WM_STATE 2>/dev/null || true)
            if ! echo "$STATE" | grep -q "_NET_WM_STATE_ABOVE"; then
                set_above "$WIN"
            fi
        fi
    done
) &
echo $! > "$PIDFILE"
disown

echo "Режим 'поверх всех' включён (watcher pid $(cat "$PIDFILE")). Повторный запуск скрипта выключит режим."



[Источник: /home/dev/.local/bin]
