# Определение переменных
Необходимо объявить следующие переменные окружения:
* TF_VAR_YANDEX_CLOUD_OAUTH
* TF_VAR_YANDEX_CLOUD_ID
* TF_VAR_YANDEX_CLOUD_FOLDER_ID

* TF_VAR_YANDEX_CLOUD_ZONE_ID
# Запуск проекта
Для запуска проекта необходимо выполнить команды:
```shell
packer init ./ubuntu-nginx.pkr.hcl
packer build ./ubuntu-nginx.pkr.hcl
terraform init
terraform apply
```
