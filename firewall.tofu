resource "google_compute_firewall" "vm_firewall" {
  name = "allow-http"
  network = google_compute_instance.vm.network_interface[0].network
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports = ["8080"]
  }
}
