provider "vsphere" {
  # If you have a self-signed cert
  allow_unverified_ssl = true
}

terraform {
  required_version = "= 0.11.13"
}

# Data sources
data "vsphere_datacenter" "dc" {
  name = "${var.dc_name}"
}

data "vsphere_datastore" "datastore" {
  name          = "${var.datastore_name}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "VM Network"
#  name = "${module.network.vm_network_name}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_resource_pool" "pool" {
  name          = "MainCluster/Resources"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

module "tags" {
  source = "modules/tags"
  project = "${var.project}"
}

module "vm" {
  source = "modules/vm"
  project = "${var.project}"
  network_id = "${data.vsphere_network.network.id}"
  datastore_id = "${data.vsphere_datastore.datastore.id}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}" 
  tags = ["${module.tags.environment_dev}","${module.tags.app_java}"]
}