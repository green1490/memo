terraform {
  required_providers {
    google = {
      source = "opentofu/google"
      version = "7.37.0"
    }
  }
}

provider "google" {
  project = "memo-499618"
  region = "europe-west6"
  zone = "europe-west6-a"
}