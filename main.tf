provider "vsphere" {
  # If you have a self-signed cert
  allow_unverified_ssl = true
}

terraform {
  required_version = "= 0.11.13"
}

variable "project" {
  default = "kawsar"
}

module "tags" {
  source = "modules/tags"
  project = "${var.project}"
}

module "vm" {
  source = "modules/vm"
  project = "${var.project}"
  tags = ["${module.tags.environment_dev}","${module.tags.app_java}"]
}