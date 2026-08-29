resource "local_file" "inventory" {
  filename = "${path.module}/inventories/inventory.ini"
  content = templatefile("${path.module}/inventory.tftpl", {
    inventory-group = var.inventory-group
    inventory-hosts = var.inventory-hosts
  })
}
