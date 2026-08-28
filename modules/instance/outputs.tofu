output "status" {
  value = google_compute_instance.vm.current_status
}

output "ip" {
  value = google_compute_address.static.address
}
