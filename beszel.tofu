module "beszel-instance" {
  source = "./modules/instance"
  instance-name = "beszel"
  disk-name = null
  network-name = google_compute_network.vm-network.name
  startup-script-path = "${path.root}/scripts/beszel-instance.sh"
  ssh-name = var.ssh-name
  ssh-pub-key = var.ssh-pub-key
  address-name = var.beszel-address-name
}

module "beszel-ansible" {
  source = "./modules/ansible"
  inventory-group = "monitoring"
  inventory-hosts = [
    module.beszel-instance.ip
  ]
  ssh-user = var.ssh-name
  private-key-path = var.path-to-ssh-private-key
}

resource "null_resource" "wait-for-beszel-sshd" {
  provisioner "remote-exec" {
    connection {
      host = module.beszel-instance.ip
      user = var.ssh-name
      private_key = file(var.path-to-ssh-private-key)
    }

    inline = [ "echo sshd is running" ]
  }

  depends_on = [ module.beszel-instance ]
}

resource "null_resource" "run-beszel-playbook" {
  provisioner "local-exec" {
    command = "ansible-playbook -i ${path.root}/modules/ansible/inventories/monitoring.ini ${path.root}/playbooks/beszel.yml -u ${var.ssh-name} --private-key ${var.path-to-ssh-private-key}"
  }
  depends_on = [ null_resource.wait-for-beszel-sshd ]
}
