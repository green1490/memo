resource "google_compute_instance" "vm" {
  name = "memo-instance"
  machine_type = "e2-micro"
  boot_disk {
    initialize_params {
        image = "opensuse-leap-16-0-v20260629-x86-64"
    }
  }

  metadata_startup_script = file("startup.sh")

  network_interface {
    network = google_compute_network.vm-network.name
    access_config {}
  }

  attached_disk {
    source = google_compute_disk.vm-disk.name
  }
}
