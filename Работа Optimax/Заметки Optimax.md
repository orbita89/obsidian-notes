Elastic
	1. Задача не делать это в getProductIdsForFilter а сделать это так что бы допустим у нас был один запрос на алголию и мы смогли получить результат что-то пришло или нет если не пришло то дальше выполнять билд нет смысла и нужно посмотреть если ли смысл два раза делать одно и тоже можно ведь одним методом делать запрос зачем дублировать.
Magento-admin
	2. https://master-gusa-admin.gusadev.com/index.php/ldradmin/system_convert_gui/edit/id/12/  -  экспрот продуктов, можно добавить аттрибут
Catalog ms
	3. Все исключения ловаить до запуска контролеров  в файле ExceptionEventSubscriber.php
		1. Напримере аттрибутов как произходит реиндекс в catalog ms  запускаеться  ImportAttributeValueCommand, потом запускаеться AttributeValuePayloadHandler