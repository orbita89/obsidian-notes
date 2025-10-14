##symfony and backend and test
#Обновит снапшоты тестов и документации иногда снапшоты могут не обновляться
тогда можно просто удалить кэш 
bin/console cache:clear или rm -rf var/cache/test/*   мне помог 2 вариант
vendor/bin/phpunit -d --update-snapshots
./vendor/bin/phpunit запуск всех тестов
php bin/console debug:router  посмотреть все апи


php vendor/bin/quality composer
php vendor/bin/quality php
php vendor/bin/quality test //тесты и так же документация 
php venor/bin/quality arch 


php vendor/zircote/swagger-php/bin/openapi \
--output docs/api/v2/doc.json \
--format json \
--debug \
--exclude vendor \
--exclude app/code/local/Glassesusa/Extlab \
--exclude app/code/local/MS/Shipping \
--exclude app/code/local/Optimax/Talkdesk \
--exclude app/code/local/Optimax/Ada \
--exclude app/code/community/Zendesk \
--exclude app/code/local/gen/lib/Model \
app/code/local app/code/community


symfony var:export --multiline > .env.local


##миграция 
php bin/console doctrine:migrations:list посмотретть стату миграций
php bin/console doctrine:migrations:status