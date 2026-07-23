resource "google_compute_disk" "vm-disk" {
  name = "memos-storage"
  type = "pd-standard"
  size = 1
}
