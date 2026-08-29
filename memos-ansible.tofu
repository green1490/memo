module "memos-ansible" {
  source = "./modules/ansible"
  inventory-group = "webserver"
  inventory-hosts = [
    module.memos-instance.ip
  ]
}
