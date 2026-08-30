variable "inventory-group" {
  type = string
}

variable "inventory-hosts" {
  type = set(string)
}

variable "ssh-user" {
  type = string
}

variable "private-key-path" {
  type = string
}
