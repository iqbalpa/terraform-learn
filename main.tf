terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  project = "movies-catalog-429305"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network-v2"
}
