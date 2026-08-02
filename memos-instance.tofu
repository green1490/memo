module "memos-instance" {
  source = "./modules/instance"
  disk-name = "memos-disk"
  instance-name = "memos"
  network-name = google_compute_network.vm-network.name
  startup-script-path = "${path.root}/scripts/memos-startup.sh"
}
