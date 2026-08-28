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

# names for google compute address
variable "beszel-ip" {
  type = string
}

variable "memos-ip" {
  type = string
}
