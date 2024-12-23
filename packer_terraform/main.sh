cd ./packer
export PKR_VAR_YANDEX_CLOUD_FOLDER_ID=$TF_VAR_YANDEX_CLOUD_FOLDER_ID
export PKR_VAR_YANDEX_CLOUD_OAUTH=$TF_VAR_YANDEX_CLOUD_OAUTH
export PKR_VAR_YANDEX_CLOUD_SUBNETWORK_ID=$YANDEX_CLOUD_SUBNET_ID
packer init .
packer build .

cd ../terraform
terraform init
terraform apply

docker run --rm cr.yandex/sol/edu-checker validate vm --token $YANDEX_CLOUD_IAM_TOKEN --folder-id $TF_VAR_YANDEX_CLOUD_FOLDER_ID
