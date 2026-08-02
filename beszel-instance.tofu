module "beszel-instance" {
  source = "./modules/instance"
  instance-name = "beszel"
  disk-name = null
  network-name = google_compute_network.vm-network.name
  startup-script-path = "${path.root}/scripts/beszel-instance.sh"
}
