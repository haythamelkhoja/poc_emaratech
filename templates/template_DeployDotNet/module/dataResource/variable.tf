variable "vsphere_cluster" {
  description = "Cluster to use for deployment"
}

variable "vsphere_datacenter" {
  description = "DC to use for deployment"
}

variable "vsphere_datastore" {
  description = "DS to use for deployment"
}

variable "network_portGroup" {
  description = "NW PG to use for deployment"
  default = "VM Network"
}

variable "template" {
  description = "Path to the VMware template to use to create resources."
}
