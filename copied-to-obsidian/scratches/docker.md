##Docker
#Сети
docker network ls  список сетей
docker network inspect docker_default  все контейнеры которые должны общаться, между собой должны быть в одной сети
docker network connect docker_default <container_name>  подключение контейнера к сети
docker network rm docker_default  острожно надо быть увереным что сеть можно пересоздать
docker network prune   удалить неиспользуемые сети
#Volumes
docker volume ls  список volume
docker volume rm docker_db-data
docker volume inspect docker_db-data информация о volume
docker volume prune удалит не использованные volume, осторожно удалит так же те которые просто остановленный
docker ps --filter volume=my_volume посмотреть кто использует volume
#Compose
docker compose config --profiles  посмотреть доступные профили
docker compose --profile magento up -d запустить
docker logs nginx логи
docker compose config объединенные конфигурации
docker compose down  удалить все контейнеры + сети
docker compose up -d  пересоздать контейнеры
docker compose up --build Принудительно пересобирает образы для всех сервисов
docker compose run <service> bash войти в контейнер
docker compose exec php84 bash -c "cd elastic && exec bash" выполнить команду
docker compose top db  посмотреть процессы по типу top только внутри контейнера
docker compose exec <service> top
#Docker debug
docker stats  # Мониторинг ресурсов посмотреть процессы
docker diff db посмотр еть изминения в докере продвинутый
docker events  если нужно поймать событие
journalctl -u docker.service -f  логи ядра
docker system df проверка не переполнен ли докер
#Docker image
docker images посмотреть все image
docker inspect <container_name> | grep Image  посмотреть какой image использует контейнер
docker history <image_name_or_id>  полезное для выполнениея больших слоев
docker build --no-cache  пересобрать образ без кэша
docker-compose build --no-cache nginx && docker-compose up -d nginx если нужно обновить image
docker compose restart
docker update --restart=no <container_name>  отключить автозапуск контейнера


##Docker-Work-Optimax
docker update --restart=no <container_id>  отключить автозапуск контейнера скорей всего если контейнер id поменяться то контейнер будет запускаться даже если я этого не захочу
docker update --restart=unless-stopped <container_name> включить обратно если нужно при старте
dup-dev='dup && sleep 2 && dup-elk && sleep 2 && dup-ms && dup-tools'  запустить контейнеры для разработки
docker start kafka кафка не всегда запускается
dup-front
ddwon-stop остановить все контейнеры