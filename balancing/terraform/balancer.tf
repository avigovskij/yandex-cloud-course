resource "yandex_lb_target_group" "test1-balancing-group" {
  name      = "test1-balancing-group"
  region_id = "ru-central1"

  target {
    subnet_id = yandex_vpc_subnet.ru-central1-a.id
    address   = yandex_compute_instance.vm-1.network_interface[0].ip_address
  }

  target {
    subnet_id = yandex_vpc_subnet.ru-central1-a.id
    address   = yandex_compute_instance.vm-2.network_interface[0].ip_address
  }
}


resource "yandex_lb_network_load_balancer" "test1-balancer" {
  name = "test1-balancer"

  listener {
    name = "my-listener"
    port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.test1-balancing-group.id

    healthcheck {
      name = "http"
      http_options {
        port = 80
        path = "/"
      }
    }
  }
}
