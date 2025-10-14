##Redis
#Очистка кэша в redis
docker exec -it 126363e1fb2f redis-cli FLUSHALL

##symfony and backend and test
#Обновит снапшоты тестов и документации иногда снапшоты могут не обновляться можно просто удалить кэш bin/console cache:clear или rm -rf var/cache/test/*
vendor/bin/phpunit -d --update-snapshots
./vendor/bin/phpunit


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





##Magento-admin
n98 dev:log:db
n98 cache:clean
#kafka
php -f shell/kafka_consumer.php order_created

##Magento



##kubectl and cloud
kubectl cp \ внешний путь \
magento-admin/magento-admin-7b6fcbb756-7cpq6:/var/www/html/shell/dsco -n magento-admin -c unit
Пода и внутренний путь
-n (namespace): указывает namespace (пространство имен) Kubernetes, в котором находится нужный pod.
-c (container): указывает имя контейнера внутри pod'а, если в pod'е несколько контейнеров.

gcloud container clusters get-credentials release-staging-optimax --region us-central1 --project staging-optimax — это команда, которая настраивает доступ к Kubernetes-кластерам в Google Cloud. В данном примере это release
gcloud container clusters list --project staging-optimax -список всех кластеров в данном проекте


##ElasticSearch
#Активный индекс посмотреть
curl -s http://elasticsearch:9200/_cat/indices?v
#Поиск по Alias можно понять активный индекс по которому будет идти поиск
curl -s http://elasticsearch:9200/_cat/aliases?v | grep __1__products
#Поменять индекс сделать активный индекс
POST http://elasticsearch:9200/_aliases
{
  "actions": [
    { "remove": { "alias": "alias_read_dev__local__1__products", "index": "dev__local__1__products__created_25.09.03_18-15-41__uid_68b84d8dd6eed" }},
    { "add":    { "alias": "alias_read_dev__local__1__products", "index": "dev__local__1__products__created_25.08.29_01-27-06__uid_68b0c9aacb22f" }},

    { "remove": { "alias": "alias_write_dev__local__1__products", "index": "dev__local__1__products__created_25.09.03_18-15-41__uid_68b84d8dd6eed" }},
    { "add":    { "alias": "alias_write_dev__local__1__products", "index": "dev__local__1__products__created_25.08.29_01-27-06__uid_68b0c9aacb22f" }}
  ]
}

#Удалить индекс
DELETE dev__local__1__products__created_25.09.03_18-15-41__uid_xxx
#Посмотреть активные поля
GET _mapping


##Symfony
#тестты
php vendor/bin/quality composer
php vendor/bin/quality php
php vendor/bin/quality test
php vendor/bin/quality arch
