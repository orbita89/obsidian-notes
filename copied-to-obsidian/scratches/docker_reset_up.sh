#!/bin/bash

set -e

echo "🔄 0. Обновление Docker и инструментов Optimax..."

# Обновляем Docker и утилиты
~/docker/bin/optimax update

echo "🚀 1. Остановка всех сервисов..."

docker compose --project-directory "$OPTIMAX_PREFIX" --profile magento down
echo "🚀 2. Остановка всех сервисов..."
docker compose --project-directory "$OPTIMAL_PREFIX" --profile elk down
docker compose --project-directory "$OPTIMAX_PREFIX" --profile mercure down
docker compose --project-directory "$OPTIMAX_PREFIX" --profile ms down
docker compose --project-directory "$OPTIMAL_PREFIX" --profile tools down

echo "🧹 2. Удаление всех контейнеров и томов..."

docker ps -qa | xargs -r docker rm -f
docker ps --filter "status=created" --filter "status=exited" -q | xargs -r docker rm -f
#docker volume ls -q | xargs -r docker volume rm   # если нужно чистить volume — раскомментируй

echo "🌐 3. Очистка сетей Docker..."

docker network prune -f

echo "⚡ 4. Пересборка и поднятие всех сервисов..."

docker compose --project-directory "$OPTIMAX_PREFIX" --profile magento up -d
docker compose --project-directory "$OPTIMAX_PREFIX" --profile elk up -d
docker compose --project-directory "$OPTIMAX_PREFIX" --profile mercure up -d
docker compose --project-directory "$OPTIMAX_PREFIX" --profile ms up -d
docker compose --project-directory "$OPTIMAX_PREFIX" --profile tools up -d

echo "🎨 5. Поднятие фронтенд сервисов (SSR, Gusa Desktop и Mobile)..."

~/docker/bin/optimax front_up --gusa-desktop
~/docker/bin/optimax front_up --gusa-mobile

echo "🎉  Все сервисы подняты и Docker обновлён. Готово!"
