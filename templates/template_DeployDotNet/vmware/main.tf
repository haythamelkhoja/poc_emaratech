# Configure the VMware vSphere Provider
provider "vsphere" {
#  user = "${var.vsphere_user}"
#  password = "${var.vsphere_password}"
#  vsphere_server = "${var.vsphere_server}"
  version = "= 1.3.3"
  allow_unverified_ssl = "true"
}

# Data resource
module "dataResource" {
  source = "git::https://github.com/haythamelkhoja/poc_emaratech//templates/template_DeployDotNet/module/dataResource"
  vsphere_datacenter  = "${var.vsphere_datacenter}"
  vsphere_datastore = "${var.vsphere_datastore}"
  vsphere_cluster = "${var.vsphere_cluster}"
  network_portGroup = "${var.network_portGroup}"
  template =  "${var.template}"
}

# Deploy New Node VMs
module "deployVM_Win2012R2" {
  source = "git::https://github.com/haythamelkhoja/poc_emaratech//templates/template_DeployDotNet/module/deployWinVM"
   #######
       folder_path = "${var.folderPath}"
   #######
       resource_pool_id = "${module.dataResource.resource_pool_id}"
       datastore_id     = "${module.dataResource.datastore_id}"
       network_id = "${module.dataResource.network_id}"
       template_uuid = "${module.dataResource.template_uuid}"
       scsi_type = "${module.dataResource.scsi_type}"
   #######
	     vmName = "${var.vmName}"
       hostName = "${var.vm_hostName}"
       admin_password = "${var.admin_password}"
       disk_size = "${var.disk_size}"
       guest_id    = "${module.dataResource.guest_id}"
	 #######
	     vm_vcpu = "${var.vm_vcpu}"
 	     vm_memory = "${var.vm_memory}"
   #######
  	   vsphere_domain = "${var.vsphere_domain}"
   #######
  	   network_ips = "${var.vm_network_ips}"
  	   network_subNet = "${var.vm_network_subNet}"
  	   network_gateway = "${var.vm_network_gateway}"
  	   dns_servers = "${var.dns_servers}"
}

