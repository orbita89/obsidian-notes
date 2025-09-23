> [!PDF|note] [[elastic.pdf#page=18&selection=2,0,23,1&color=note|elastic, p.18]]
> > Я глубоко благодарен своей семье и друзьям за их неизменную поддержку и за то, что вдохновили меня на написание этой книги. Особенно я благодарен своим родителям, своей жене Чанчал и своим детям, Анвиту и Адитри, за их терпение и понимание во время этой работы. Я также благодарен издательству BPB Publications за руководство и
> 
> POST /products/_doc/1
{
  "name": "Очки Ray-Ban RB2132",
  "price": 120,
  "category": "sunglasses"
}

POST /products/_doc/2
{
  "name": "Оправа Gucci GG0010O",
  "price": 250,
  "category": "eyeglasses"
}

POST /movie/_doc/2
{
  "name": "Оправа Gucci GG0010O",
  "price": 250,
  "category": "eyeglasses"
}

DELETE movie


PUT movie
{
  "settings": {
    "number_of_shards": 3
  }
}

POST /movie/_doc
{
  "movieId": 1,
  "name": "Конец света в Америке"
}

GET /movie

#посмотреть в какой шард 
GET movie/_search_shards?routing=1

#Шарды
GET _cat/shards

#Все индексы
GET _cat/indices

#Краткий статус кластера
GET _cat/health

#анализ по коду
POST /movie/_analyze
{"text": "днём рожения", "analyzer": "standard"}


GET /movie/_search
{
  "query": {
    "match": {
      "name": "днём"
    }
  }
}

