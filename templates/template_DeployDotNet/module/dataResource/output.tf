output "datacenter_id" {
  value = "${data.vsphere_datacenter.dc.id}"
}

output "resource_pool_id" {
  value = "${data.vsphere_resource_pool.pool.id}"
}

output "datastore_id" {
  value = "${data.vsphere_datastore.datastore.id}"
}

output "network_id" {
  value = "${data.vsphere_network.network.id}"
}

output "template_uuid" {
  value = "${data.vsphere_virtual_machine.template.id}"
}

output "scsi_type" {
value = "${data.vsphere_virtual_machine.template.scsi_type}"
}

output "guest_id" {
value = "${data.vsphere_virtual_machine.template.guest_id}"
}
