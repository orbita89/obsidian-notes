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
