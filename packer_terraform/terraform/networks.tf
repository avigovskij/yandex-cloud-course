resource "yandex_vpc_network" "from-terraform-network" {
  name = "from-terraform-network"
}

resource "yandex_vpc_subnet" "from-terraform-subnet" {
  zone           = "ru-central1-a"
  name           = "from-terraform-subnet"
  network_id     = yandex_vpc_network.from-terraform-network.id
  v4_cidr_blocks = ["10.2.0.0/16"]
}
