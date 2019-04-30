variable "dc" {
  default = "PacketDatacenter"
}

data "vsphere_datacenter" "dc" {
  name = "${var.dc}"
}

resource "vsphere_virtual_machine" "vm" {
  name             = "${var.project}-terraform-vm"
  resource_pool_id = "${var.resource_pool_id}"
  datastore_id     = "${var.datastore_id}"

  num_cpus = 2
  memory   = 1024
  guest_id = "other3xLinux64Guest"
  wait_for_guest_net_routable = false
  wait_for_guest_net_timeout  = 0

  network_interface {
    network_id = "${var.network_id}"
  }

  disk {
    label = "disk0"
    size  = 20
  }

  tags = ["${var.tags}"]
}
