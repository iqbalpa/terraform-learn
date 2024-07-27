variable "project" {
  type = string
}

variable "vm_instance_name" {
  type    = string
  default = "terraform-instance"
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "zone" {
  type    = string
  default = "us-central1-c"
}

variable "machine_type" {
  type    = string
  default = "f1-micro"
}

variable "vpc_network_name" {
  type    = string
  default = "terraform-network"
}

variable "ssh_pub_key" {
  type = string
}

variable "ssh_username" {
  type = string
}

variable "boot_disk" {
  type    = string
  default = "cos-cloud/cos-113-lts"
}

variable "domain_name" {
  type = string
}

variable "dns_record_name" {
  type = string
}

variable "managed_zone_name" {
  type = string
}

variable "script_path" {
  type    = string
  default = "./script.sh"
}