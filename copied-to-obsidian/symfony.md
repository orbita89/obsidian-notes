##
bin/console import:consumer:product
vendor/bin/phpunit -d  --update-snapshots

bin/console doctrine:migrations:migrate


php bin/console doctrine:migrations:generate //пустая миграция

curl -k https://catalog.local/test
curl -k https://catalog.local/doc.admin.json


php bin/console doctrine:migrations:execute DoctrineMigrations\\Version20251126023357 --up


curl -X POST "https://master.gusadev.com/customer/token" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "grant_type=client_credentials" \
-d "client_id=2f552db8-7992-4324-80b5-882073187102" \
-d "client_secret=1gks9snz5s68kwk044gkgcsc8gwco00cw8488k488sc40w8gk8" \
-d "user_id=1440318"

curl -k GET "https://catalog.local/v1/1/product/97856"


curl -k POST --location 'https://catalog.local/admin/v1/product/attribute-set/26' \
--header "X-Store-Id: 1" \
--header "Content-Type: application/json" \
--data '{
"description": "description",
"shortDescription": "shortDescription",
"brandId": 33,
"sku": "ray-ban-frame-2qwqtetsss",
"urlKey": "/ray-ban-frame-2qwqtetsss",
"name": "Ray ban",
"status": true,
"parentId": 517,
"isIncludeDynamicCategory": true,
"isDiscontinued": true,
"is3dModelAvailable": true,
"visibility": 1,
"websiteIds": [
0,
1,
2
],
"categoryIds": [
3
],
"colorIds": [],
"genderIds": [],
"shapeIds": [],
"lensTypeIds": [],
"materialIds": [],
"linkProductIds": [],
"weight": 15.0,
"nationalProdNo": "15",
"manufacturerId": null,
"suppliersku": "Chain 3- Silver",
"eligibleForVistaPlus": true,
"dscoProduct": true,
"subscriptionAvailable": true,
"dscoImageCode": "sku1,sku2",
"countryOfManufactureId": null,
"badgeId": null,
"secondBadgeId": null,
"wizardId": "1",
"dimension": {
"templeLength": 140,
"bridgeWidth": "15",
"lensWidth": 54,
"lensHeight": 31,
"bridgeWidthReal": 17.0,
"lensWidthReal": 18.0,
"lensHeightReal": 19.0,
"totalWidth": 140,
"diameter": "13",
"base": "12",
"frameSizeId": 66
},
"price": {
"price": 15.20,
"cost": 10.00,
"msrp": 20.00,
"directContributionRate": 10.00,
"msrpEnabled": "1",
"msrpDisplayActualPriceType": "1",
"grossCost": 15.20
},
"seo": {
"metaTitle": "metaTitle",
"metaDescription": "metaDescription",
"metaKeyword": "metaKeyword",
"canonical": "/example",
"robots": "{\"name\": \"value\"}",
"disableHttpCode": 404,
"metadata": "metadata"
},
"images": [
{
"source": "",
"label": "",
"position": 1,
"baseImage": true,
"smallImage": true,
"thumbnail": true,
"exclude": false
}
],
"gallery": [
{
"alias": "",
"source": "",
"frameQty": 1,
"firstFrame": 1,
"rotationDirection": 1,
"width": 1, 
"height": 1,
"autoplay": true,
"controlsPb": false,
"controlsLr": true,
"controlsZoom": false,
"isDisplayed": true,
"isImageMain": false,
"position": 1
}
],
"videos": [
{
"genderId": 1,
"thumbnail": "4_31-m0012_1.gif",
"videoUrl": "https://player.vimeo.com/video/319275458",
"isDefault": true,
"preview": "4_31-M0012.jpg"
}
],
"mirror": {
"enabled": false,
"image": "/1/0/10n-758_f.jpg",
"sgImage": "/1/0/10n-758_f.jpg"
},
"modelNumber": "modelNumber",
"upc": "UPC123456",
"springHinges": true,
"eligibleForRxLenses": true,
"frameTypeIds": [],
"styleIds": [],
"faceShapeIds": [],
"featureIds": [],
"glassesTypeIds": [],
"sportTypeIds": [],
"lensFeatureIds": [],
"lowBridgeFit": true,
"defaultLensTintId": null,
"defaultLensDarknessId": null,
"nextDayDeliveryEligible": true,
"useLensPackage": true,
"sportStyleIds": [],
"standardIds": [],
"safetyUsageIds": [],
"readyMadeLenses": false,
"useDefaultAttributes": [
"name",
"wizard_id",
"is_include_dynamic_category",
"related_product_sku",
"eligible_for_vista_plus",
"status",
"description",
"short_description",
"msrp_enabled",
"msrp",
"msrp_display_actual_price_type",
"price",
"direct_contribution_rate",
"grosscost",
"special_from_date",
"special_to_date",
"special_price",
"boxes_per_month",
"rebate_discount",
"visibility",
"meta_title",
"meta_description",
"meta_keyword",
"robots",
"canonical",
"disable_http_code",
"disable_http_code",
"product_badge",
"second_badge"
]
}'
