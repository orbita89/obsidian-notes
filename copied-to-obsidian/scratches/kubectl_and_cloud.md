##kubectl and cloud
kubectl cp \ внешний путь \
magento-admin/magento-admin-7b6fcbb756-7cpq6:/var/www/html/shell/dsco -n magento-admin -c unit
Пода и внутренний путь
-n (namespace): указывает namespace (пространство имен) Kubernetes, в котором находится нужный pod.
-c (container): указывает имя контейнера внутри pod'а, если в pod'е несколько контейнеров.

gcloud container clusters get-credentials release-staging-optimax --region us-central1 --project staging-optimax — это команда, которая настраивает доступ к Kubernetes-кластерам в Google Cloud. В данном примере это release
gcloud container clusters list --project staging-optimax - список всех кластеров в данном проекте

kubectl config delete-context <context-name> если кластер не запускается можно удалить и заново установить 
kubectl config get-contexts - посмотреть все кластеры которые есть