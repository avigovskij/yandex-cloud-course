# Определение переменных
Необходимо объявить следующие переменные окружения:
* YANDEX_CLOUD_OAUTH
* YANDEX_CLOUD_ID
* YANDEX_CLOUD_FOLDER_ID
* YANDEX_CLOUD_ZONE_ID
# Запуск проекта
Для запуска проекта необходимо выполнить команды:
```shell
packer init ./ubuntu-nginx.pkr.hcl
packer build ./ubuntu-nginx.pkr.hcl
terraform init
terraform apply
```