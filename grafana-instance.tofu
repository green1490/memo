module "grafana-instance" {
  source = "./modules/instance"
  instance-name = "grafana"
  disk-name = null
  network-name = google_compute_network.vm-network.name
  startup-script-path = "${path.root}/scripts/grafana-startup.sh"

  depends_on = [ google_compute_network.vm-network ]
}
