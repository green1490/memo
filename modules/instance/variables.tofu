variable "disk-type" {
  type = string
  default = "pd-standard"
}

variable "disk-size" {
  type = number
  default = 1
}

variable "disk-name" {
  type = string
  nullable = true
}

variable "instance-name" {
  type = string
}

variable "startup-script-path" {
  type = string
}

variable "network-name" {
  type = string
  default = "vm-network"
}

variable "ssh-name" {
  type = string
  nullable = true
}

variable "ssh-pub-key" {
  type = string
  nullable = true
}

variable "ip-address" {
  type = string
}
