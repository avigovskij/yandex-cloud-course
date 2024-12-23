data "yandex_compute_image" "nginx_ubuntu" {
  name = "my-ubuntu-nginx"
}

resource "yandex_compute_instance" "vm-1" {
  name = "from-terraform-vm"

  platform_id = "standard-v1"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.nginx_ubuntu.image_id
    }
  }

  metadata = {
    serial-port-enable = true
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.from-terraform-subnet.id
    nat = true
  }
}

resource "yandex_mdb_postgresql_cluster" "postgres_cluster" {
  name        = "test-vm"
  environment = "PRESTABLE"

  network_id  = yandex_vpc_network.from-terraform-network.id

  config {
    version = 15
    resources {
      resource_preset_id = "s3-c2-m8"
      disk_type_id       = "network-ssd"
      disk_size          = 10
    }
    postgresql_config = {
      max_connections                   = 395
      enable_parallel_hash              = true
      autovacuum_vacuum_scale_factor    = 0.34
      default_transaction_isolation     = "TRANSACTION_ISOLATION_READ_COMMITTED"
      shared_preload_libraries          = "SHARED_PRELOAD_LIBRARIES_AUTO_EXPLAIN,SHARED_PRELOAD_LIBRARIES_PG_HINT_PLAN"
    }
  }

  maintenance_window {
    type = "WEEKLY"
    day  = "SAT"
    hour = 12
  }

  host {
    zone      = "ru-central1-a"
    subnet_id = yandex_vpc_subnet.from-terraform-subnet.id
  }
}
