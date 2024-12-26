resource "yandex_vpc_network" "default" {
  name = "default"
}

resource "yandex_vpc_subnet" "ru-central1-a" {
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.default.id
  v4_cidr_blocks = ["10.128.0.0/24"]
}
