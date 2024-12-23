packer {
  required_plugins {
    yandex = {
      version = "~> 1"
      source  = "github.com/hashicorp/yandex"
    }
  }
}

variable "YANDEX_CLOUD_OAUTH" {
  type = string
  sensitive = true
}

variable "YANDEX_CLOUD_FOLDER_ID" {
  type = string
}


source "yandex" "ubuntu-nginx" {
  token               = var.YANDEX_CLOUD_OAUTH
  folder_id           = var.YANDEX_CLOUD_FOLDER_ID
  source_image_family = "ubuntu-2004-lts"
  ssh_username        = "ubuntu"
  use_ipv4_nat        = "true"
  image_description   = "my custom ubuntu with nginx"
  image_family        = "ubuntu-2004-lts"
  image_name          = "my-ubuntu-nginx"
  disk_type           = "network-ssd"
  zone                = "ru-central1-a"
}

build {
  sources = ["source.yandex.ubuntu-nginx"]

  provisioner "shell" {
    inline = ["sudo apt-get update -y",
              "sudo apt-get install -y nginx",
              "sudo systemctl enable nginx.service"]
  }
}
