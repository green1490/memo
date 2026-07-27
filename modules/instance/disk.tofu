resource "google_compute_disk" "vm-disk" {
  lifecycle {
    enabled = var.disk-name != null ? true : false
  }
  name = var.disk-name
  type = var.disk-type
  size = var.disk-size
}
