variable "ssh-name" {
  type = string
}

variable "ssh-pub-key" {
  type = string
}

variable "network-name" {
  type = string
  default = "network-name"
}

variable "path-to-ssh-private-key" {
  type = string
}

variable "beszel-address-name" {
  type = string
}

variable "memos-address-name" {
  type = string
}
