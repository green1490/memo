module "memos-instance" {
  source = "./modules/instance"
  disk-name = "memos-disk"
  instance-name = "memos"
  network-name = google_compute_network.vm-network.name
  ssh-name = var.ssh-name
  ssh-pub-key = var.ssh-pub-key
  address-name = var.memos-address-name
}

module "memos-ansible" {
  source = "./modules/ansible"
  inventory-group = "webserver"
  inventory-hosts = [
    module.memos-instance.ip
  ]
  ssh-user = var.ssh-name
  private-key-path = var.path-to-ssh-private-key
}

resource "null_resource" "wait-for-memos-sshd" {
  provisioner "remote-exec" {
    connection {
      host = module.memos-instance.ip
      user = var.ssh-name
      private_key = file(var.path-to-ssh-private-key)
    }

    inline = [ "echo sshd is running" ]
  }

  depends_on = [ module.memos-instance ]
}

resource "null_resource" "run-memos-playbook" {
  provisioner "local-exec" {
    command = "ansible-playbook -i ${path.root}/modules/ansible/inventories/webserver.ini ${path.root}/playbooks/memos.yml -u ${var.ssh-name} --private-key ${var.path-to-ssh-private-key} --extra-vars 'beszel_host=${module.beszel-instance.ip}'"
  }

  depends_on = [ null_resource.wait-for-memos-sshd ]
}
