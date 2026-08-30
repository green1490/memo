resource "local_file" "inventory" {
  filename = "${path.module}/inventories/${var.inventory-group}.ini"
  content = templatefile("${path.module}/inventory.tftpl", {
    inventory-group = var.inventory-group
    inventory-hosts = var.inventory-hosts
  })
}
