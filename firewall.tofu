resource "google_compute_firewall" "vm-firewall" {
  name = "allow-http"
  network = google_compute_network.vm-network.name
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports = ["8080"]
  }

  allow {
    protocol = "tcp"
    ports = ["22"]
  }
}
