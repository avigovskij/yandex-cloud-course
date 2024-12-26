output "machines" {
    value = [
        for machine in [yandex_compute_instance.vm-1, yandex_compute_instance.vm-2] :
        {
            ip: machine.network_interface[0].nat_ip_address,
            user: "ubuntu"
        }
    ]
}