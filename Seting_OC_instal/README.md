
📌 Установка программ в Linux

Этот файл помогает отслеживать установку программ и возникающие проблемы.

📂 Список устанавливаемых программ

🔹 Основные приложения:

🛡 Hiddify (VPN)

💬 Telegram (мессенджер)

🌍 Google Chrome (браузер)

🌐 Yandex Browser (браузер)

   PHPSTORM - https://blog.llinh9ra.ru/%D0%B0%D0%BA%D1%82%D0%B8%D0%B2%D0%B0%D1%86%D0%B8%D1%8F-phpstorm-webstorm-intellij-idea-%D0%B8-%D0%B4%D1%80%D1%83%D0%B3%D0%B8%D0%B5-%D0%BF%D1%80%D0%BE%D0%B4%D1%83%D0%BA%D1%82%D1%8B-jetbrains-%D0%B2/
   https://3.jetbra.in/

⚙️ Системные утилиты:

📁 Ranger (консольный файловый менеджер)

🐳 Docker (контейнеризация)

🖥 PHP (разработка)

⚠️ Возможные проблемы и решения

❌ Приложение отсутствует в пакетном менеджере

Некоторые программы недоступны в официальных репозиториях, поэтому их приходится устанавливать вручную через .deb или .rpm архивы.

🛠 Варианты установки:

DebtAP (преобразует .deb в пакет для Arch-based дистрибутивов)

✅ Приложение появляется в поиске пакетного менеджера.

⚠️ Иногда требует обновления БД, но после обновления всё равно может выдавать ошибку.

Распаковка архива вручную

✅ Быстро, без лишних зависимостей.

❌ Программа не появится в поиске.

🛠 Нужно добавить исполняемые файлы в PATH или создать .desktop файл.

**ZRAM + маленький fallback**

sudo apt update
sudo apt install -y zram-tools

sudo nano /etc/default/zramswap

# Compression algorithm selection
ALGO=lz4

# Specifies the amount of RAM that should be used for zram
# based on a percentage the total amount of available memory
# For 16GB RAM, 75% ≈ 12G
PERCENT=75

# If you prefer fixed size instead of percent (MiB), comment PERCENT and use:
# SIZE=12288

# Priority for zram swap devices (higher than disk swap)
PRIORITY=100

## 3) Перезапустить сервис zramswap

`sudo systemctl daemon-reload sudo systemctl restart zramswap.service sudo systemctl enable zramswap.service`

Проверьте статус:

`systemctl status zramswap.service --no-pager`

Если сервис падает — см. раздел «Отладка» ниже.

---

## 4) Создание fallback swap-файла 512 MB (низкий приоритет)

Создаём файл:

`sudo swapoff -a              # временно отключаем swap sudo fallocate -l 512M /swapfile sudo chmod 600 /swapfile sudo mkswap /swapfile`

Включаем с низким приоритетом:

`sudo swapon --priority 1 /swapfile`

Добавляем в `/etc/fstab` (чтобы остался после перезагрузки):

`echo '/swapfile none swap sw,pri=1 0 0' | sudo tee -a /etc/fstab`

Пояснение: `pri=1` — очень низкий приоритет, т.е. zram (priority 100) будет использоваться первым, а swapfile — только если zram переполнится.

---

## 5) Настройка vm.swappiness и vfs_cache_pressure

Рекомендуемые значения для ноутбука:

- `vm.swappiness=10` — система будет свопить очень неохотно.
    
- `vm.vfs_cache_pressure=50` — меньше агрессивности по очистке кэша VFS.
    

Применяем:

`echo "vm.swappiness=10" | sudo tee /etc/sysctl.d/99-swappiness.conf echo "vm.vfs_cache_pressure=50" | sudo tee /etc/sysctl.d/99-vfs-cache.conf sudo sysctl --system`

Проверяем:

`cat /proc/sys/vm/swappiness cat /proc/sys/vm/vfs_cache_pressure`

https://theresanaiforthat.com/


php-class-diagram - выстраивания диаграмм

php-class-diagram ~/docker/src/backend/microservices/elastic/src/Service \
  > service.puml && plantuml -tsvg service.puml
  > 
   -   -     команда которая запускает схему классов