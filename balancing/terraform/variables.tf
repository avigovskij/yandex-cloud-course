variable "YANDEX_CLOUD_OAUTH" {
    sensitive = true
    type = string
}

variable "YANDEX_CLOUD_ID" {
  type = string
}

variable "YANDEX_CLOUD_FOLDER_ID" {
  type = string
}

variable "YANDEX_CLOUD_ZONE_ID" {
  default = "ru-central1-a"
  type = string
}
