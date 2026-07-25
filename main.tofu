terraform {
  required_providers {
    google = {
      source = "opentofu/google"
      version = "7.37.0"
    }
  }

  backend "gcs" {
    bucket = "openstate-prod"
  }
}

provider "google" {
  project = "memo-499618"
  region = "europe-west6"
  zone = "europe-west6-a"
}

module "memos-instance" {
  source = "./modules/instance"
  disk-name = "memos-disk"
  instance-name = "memos"
  startup-script-path = "${path.root}/startup.sh"
}
