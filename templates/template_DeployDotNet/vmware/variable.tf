############# PROVIDER ###############
/*variable "vsphere_server"{
  description = "vCenter IP"
}

variable "vsphere_user"{
  description = "vCenter user ID"
}

variable "vsphere_password"{
  description = "vCenter login password"
}*/

############ Create Folder and vSphere details#############

variable "folderPath"{
  description = "folder path to deploy the vm"
}

variable "vmName"{
  description = "VM name"
}

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


############ New Node ##########

variable "vm_vcpu" {
  default = 4
  description = "VM Vcpu count"
}

variable "vm_memory" {
  default = 8192
  description = "VM memory"
}

variable "vm_hostName" {
  description = "List of host name to assign to generated nodes."
  type = "list"
}

variable "admin_password"{
  description = "Windows admin password"
}

variable "vm_network_ips" {
  description = "List of public IP's to assign to generated nodes."
  type = "list"
}

variable "vm_network_subNet" {
  description = "Public network prefix length"
}

variable "vm_network_gateway" {
  description = "vCenter networking gateway"
}

variable "template" {
  description = "Path to the VMware template to use to create resources."
}

############### NETWORK ####################
variable "vsphere_domain" {
  description = "vCenter networking domain"
}

variable "dns_servers" {
  default = [""]
  type = "list"
  description = "vCenter comma-separated primary,secondary networking DNS"
}

variable "disk_size" {
  default = "200"
  description = "Disk 0 size"
}

###################################
