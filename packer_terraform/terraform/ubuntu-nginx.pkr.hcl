packer {
  required_plugins {
    yandex = {
      version = "~> 1"
      source  = "github.com/hashicorp/yandex"
    }
  }
}

source "yandex" "ubuntu-nginx" {
  token               = "y0_AgAAAAB5HtgUAATuwQAAAAEZsYQ1AABnLCKLrh1Ph6t2NJvJLipiiULXXg"
  folder_id           = "b1gj8p46qvv2f27535u7"
  source_image_family = "ubuntu-2004-lts"
  ssh_username        = "ubuntu"
  use_ipv4_nat        = "true"
  image_description   = "my custom ubuntu with nginx"
  image_family        = "ubuntu-2004-lts"
  image_name          = "my-ubuntu-nginx"
  subnet_id           = "e9bc2688ddvp37rmcibn"
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