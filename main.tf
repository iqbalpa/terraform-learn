terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

# Create VPC Network
resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

# Create VM Instance
resource "google_compute_instance" "vm_instance" {
  name         = var.vm_instance_name
  machine_type = "f1-micro"
  zone         = "us-central1-c"
  tags         = ["terraform-learn"]

  # Add ssh keys
  metadata = {
    ssh-keys = "${var.ssh_username}:${var.ssh_pub_key}"
  }

  # Operating System
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  # Network setting
  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
      nat_ip = google_compute_address.static.address
    }
  }

  # Startup Script to configure Nginx
  metadata_startup_script = file(var.script_path)
}

# Create Firewall Rules
resource "google_compute_firewall" "ssh-rule" {
  name    = "allow-ssh"
  network = google_compute_network.vpc_network.name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  target_tags   = ["terraform-learn"]
  source_ranges = ["0.0.0.0/0"]
}
resource "google_compute_firewall" "allow-http" {
  name    = "allow-http"
  network = google_compute_network.vpc_network.name
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  target_tags   = ["terraform-learn"]
  source_ranges = ["0.0.0.0/0"]
}
resource "google_compute_firewall" "allow-3000" {
  name = "allow-3000"
  network = google_compute_network.vpc_network.name
  allow {
    protocol = "tcp"
    ports    = ["3000"]
  }
  target_tags   = ["terraform-learn"]
  source_ranges = ["0.0.0.0/0"]
}

# Reserve Static IP Address
resource "google_compute_address" "static" {
  name = "ipv4-address"
}