##Redis
#Очистка кэша в redis
docker exec -it 126363e1fb2f redis-cli FLUSHALL
#Удалить ключи в которые создались в при помощью скрипта
docker exec -it redis sh -c 'redis-cli KEYS "zc:k:*" | xargs -n 1 redis-cli DEL'