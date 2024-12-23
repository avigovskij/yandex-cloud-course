terraform {
    required_providers {
            yandex = {
            source = "yandex-cloud/yandex"
        }
    }
}

provider "yandex" {
    token     =  var.YANDEX_CLOUD_OAUTH
    cloud_id  = var.YANDEX_CLOUD_ID
    folder_id = var.YANDEX_CLOUD_FOLDER_ID
    zone      = var.YANDEX_CLOUD_ZONE_ID
}
