#!/bin/bash

set -e  # Остановить выполнение при ошибке

echo "🚀 Начинаем установку необходимых программ..."

# Обновление системы
# Утилита noconfirm убирает все подверждения Y/N
sudo pacman -Syu --noconfirm
# Нужно для быстрого перехода по папкам zoxide fzf
sudo pacman -S zoxide fzf


# Установка базовых утилит
# alacarte нужно для создание приложения которые были созданы не стандартно например архивом
sudo pacman -S --needed --noconfirm vim neofetch ranger yay alacarte warp-terminal-bin

# Установка браузеров
yay -S --noconfirm google-chrome yandex-browser debtap

# Установка Telegram
# yay -S --needed --noconfirm telegram-desktop

# Установка Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "💻 Устанавливаем Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    chsh -s $(which zsh)
    echo "✅ Oh My Zsh установлен и сделан основным shell."
else
    echo "ℹ️ Oh My Zsh уже установлен."
fi

# Очистка кэша
yay -Yc --noconfirm

echo "✅ Установка завершена! Перезапусти терминал или систему, чтобы применить изменения."
