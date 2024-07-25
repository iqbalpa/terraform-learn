variable "project" {}

variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-c"
}

variable "ssh_pub_key" {}
variable "ssh_username" {}

variable "vm_instance_name" {}

variable "script_path" {
  type = string
}