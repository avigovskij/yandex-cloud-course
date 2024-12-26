resource "yandex_compute_instance" "vm-1" {
  name = "test-vm1"

  platform_id = "standard-v3"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = yandex_compute_image.ubuntu.id
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
    serial-port-enable = true
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.ru-central1-a.id
    nat = true
  }
}

resource "yandex_compute_instance" "vm-2" {
  name = "test-vm2"

  platform_id = "standard-v3"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = yandex_compute_image.ubuntu.id
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.ru-central1-a.id
    nat = true
  }
}
