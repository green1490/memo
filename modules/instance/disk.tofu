resource "google_compute_disk" "vm-disk" {
  name = var.disk-name
  type = var.disk-type
  size = var.disk-size

  lifecycle {
    enabled = var.disk-name != null ? true : false
  }
}
