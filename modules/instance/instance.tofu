resource "google_compute_instance" "vm" {
  name = var.instance-name
  machine_type = "e2-micro"
  boot_disk {
    initialize_params {
        image = "opensuse-leap-16-0-v20260629-x86-64"
    }
  }

  metadata_startup_script = file(var.startup-script-path)

  network_interface {
    network = var.network-name
    access_config {}
  }

  dynamic "attached_disk" {
    for_each = google_compute_disk.vm-disk != null ? [0] : []
    content {
      source = google_compute_disk.vm-disk.name
    }
  }
}
