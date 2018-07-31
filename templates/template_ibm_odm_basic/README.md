# template_ibm_odm_basic
Install odd basic on a single node with Liberty

NOTICES

- This has been developed for a POC Only, will need further consideration and testing before publishing
- Deploys Liberty and the DC and Rules Server in a single Liberty Server
- Relies on shared variables vSphere_Environments, vSphere_Operating_System_Templates, the XML for these is below.
- TEST URLS - http://IPADDRESS:9090/decisioncenter (rtsAdmin/rtsAdmin) http://IPADDRESS:9090/res


vSphere_Operating_System_Templates

[
{
"name": "memory",
"type": "string",
"description": "memory",
"label": "memory",
"required": "true",
"secured": "false",
"immutable": "false",
"hidden": "false",
"default": 1024,
"options": null
},
{
"name": "number_of_vcpu",
"type": "string",
"description": "number_of_vcpu",
"label": "number_of_vcpu",
"required": "true",
"secured": "false",
"immutable": "false",
"hidden": "false",
"default": 2,
"options": null
},
{
"name": "disk1_template",
"type": "string",
"description": "disk1_template",
"label": "disk1_template",
"required": "true",
"secured": "false",
"immutable": "false",
"hidden": "false",
"default": "",
"options": null
},
{
"name": "vmware_image_ssh_user",
"type": "string",
"description": "vmware_image_ssh_user",
"label": "vmware_image_ssh_user",
"required": "true",
"secured": "false",
"immutable": "false",
"hidden": "false",
"default": "root",
"options": null
},
{
"name": "vmware_image_ssh_password",
"type": "password",
"description": "vmware_image_ssh_password",
"label": "vmware_image_ssh_password",
"required": "true",
"secured": "true",
"immutable": "false",
"hidden": "false",
"default": "",
"options": null,
"value": ""
}
]



vSphere_Environments



[
{
"name": "vsphere_datastore",
"type": "string",
"description": "vsphere_datastore",
"label": "vsphere_datastore",
"required": "true",
"secured": "false",
"immutable": "false",
"hidden": "false",
"default": "",
"options": null
},
{
"name": "ipv4_gateway",
"type": "string",
"description": "ipv4_gateway",
"label": "ipv4_gateway",
"required": "true",
"secured": "false",
"immutable": "false",
"hidden": "false",
"default": "",
"options": null
},
{
"name": "ipv4_netmask",
"type": "string",
"description": "ipv4_netmask",
"label": "ipv4_netmask",
"required": "true",
"secured": "false",
"immutable": "false",
"hidden": "false",
"default": "",
"options": null
},
{
"name": "network_label",
"type": "string",
"description": "network_label",
"label": "network_label",
"required": "true",
"secured": "false",
"immutable": "false",
"hidden": "false",
"default": "",
"options": null
},
{
"name": "vsphere_default_resource_pool",
"type": "string",
"description": "vsphere_default_resource_pool",
"label": "vsphere_default_resource_pool",
"required": "true",
"secured": "false",
"immutable": "false",
"hidden": "false",
"default": "",
"options": null
},
{
"name": "domain",
"type": "string",
"description": "domain",
"label": "domain",
"required": "true",
"secured": "false",
"immutable": "false",
"hidden": "false",
"default": "",
"options": null
},
{
"name": "vsphere_dns_suffix_list",
"type": "list",
"description": "vsphere_dns_suffix_list",
"label": "vsphere_dns_suffix_list",
"required": "true",
"secured": "false",
"immutable": "false",
"hidden": "false",
"default": [
"rtp.raleigh.ibm.com"
],
"options": null
},
{
"name": "vsphere_dns",
"type": "list",
"description": "vsphere_dns",
"label": "vsphere_dns",
"required": "true",
"secured": "false",
"immutable": "false",
"hidden": "false",
"default": [
"9.42.106.2",
"9.42.106.3"
],
"options": null
},

{
"name": "folder",
"type": "string",
"description": "folder",
"label": "folder",
"required": "true",
"secured": "false",
"immutable": "false",
"hidden": "false",
"default": "",
"options": null
},
{
"name": "vsphere_datacenter",
"type": "string",
"description": "vsphere_datacenter",
"label": "vsphere_datacenter",
"required": "true",
"secured": "false",
"immutable": "false",
"hidden": "false",
"default": "",
"options": null
}
]

