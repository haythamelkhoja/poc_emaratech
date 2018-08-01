# =================================================================
# Copyright 2017 IBM Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
#	you may not use this file except in compliance with the License.
#	You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
#	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# =================================================================


##############################################################
# Keys - CAMC (public/private) & optional User Key (public)
##############################################################
variable "user_public_ssh_key" {
  type        = "string"
  description = "User defined public SSH key used to connect to the virtual machine. The format must be in openSSH."
  default     = "None"
}

variable "ibm_stack_id" {
  description = "A unique stack id."
}

variable "ibm_pm_public_ssh_key" {
  description = "Public CAMC SSH key value which is used to connect to a guest, used on VMware only."
}

variable "ibm_pm_private_ssh_key" {
  description = "Private CAMC SSH key (base64 encoded) used to connect to the virtual guest."
}

variable "allow_unverified_ssl" {
  description = "Communication with vsphere server with self signed certificate"
  default     = "true"
}

##############################################################
# Define the vsphere provider
##############################################################
provider "vsphere" {
  allow_unverified_ssl = "${var.allow_unverified_ssl}"
  version              = "~> 1.3"
}

provider "camc" {
  version = "~> 0.2"
}

##############################################################
# Define pattern variables
##############################################################
##### unique stack name #####
variable "ibm_stack_name" {
  description = "A unique stack name."
}

##############################################################
# Vsphere data for provider
##############################################################
data "vsphere_datacenter" "ODMNode01_datacenter" {
  name = "${var.ODMNode01_datacenter}"
}

data "vsphere_datastore" "ODMNode01_datastore" {
  name          = "${var.ODMNode01_root_disk_datastore}"
  datacenter_id = "${data.vsphere_datacenter.ODMNode01_datacenter.id}"
}

data "vsphere_resource_pool" "ODMNode01_resource_pool" {
  name          = "${var.ODMNode01_resource_pool}"
  datacenter_id = "${data.vsphere_datacenter.ODMNode01_datacenter.id}"
}

data "vsphere_network" "ODMNode01_network" {
  name          = "${var.ODMNode01_network_interface_label}"
  datacenter_id = "${data.vsphere_datacenter.ODMNode01_datacenter.id}"
}

data "vsphere_virtual_machine" "ODMNode01_template" {
  name          = "${var.ODMNode01-image}"
  datacenter_id = "${data.vsphere_datacenter.ODMNode01_datacenter.id}"
}

##### Environment variables #####
#Variable : ibm_im_repo
variable "ibm_im_repo" {
  type        = "string"
  description = "IBM Software  Installation Manager Repository URL (https://<hostname/IP>:<port>/IMRepo) "
}

#Variable : ibm_im_repo_password
variable "ibm_im_repo_password" {
  type        = "string"
  description = "IBM Software  Installation Manager Repository Password"
}

#Variable : ibm_im_repo_user
variable "ibm_im_repo_user" {
  type        = "string"
  description = "IBM Software  Installation Manager Repository username"
  default     = "repouser"
}

#Variable : ibm_pm_access_token
variable "ibm_pm_access_token" {
  type        = "string"
  description = "IBM Pattern Manager Access Token"
}

#Variable : ibm_pm_service
variable "ibm_pm_service" {
  type        = "string"
  description = "IBM Pattern Manager Service"
}

#Variable : ibm_sw_repo
variable "ibm_sw_repo" {
  type        = "string"
  description = "IBM Software Repo Root (https://<hostname>:<port>)"
}

#Variable : ibm_sw_repo_user
variable "ibm_sw_repo_user" {
  type        = "string"
  description = "IBM Software Repo Username"
  default     = "repouser"
}

##### odm_install variables #####
#Variable : ibm_sw_repo_password
variable "ibm_sw_repo_password" {
  type        = "string"
  description = "IBM Software Repo Password"
}

##### ODMNode01 variables #####
#Variable : ODMNode01-image
variable "ODMNode01-image" {
  type        = "string"
  description = "Operating system image id / template that should be used when creating the virtual image"
}

#Variable : ODMNode01-name
variable "ODMNode01-name" {
  type        = "string"
  description = "Short hostname of virtual machine"
}

#Variable : ODMNode01-os_admin_user
variable "ODMNode01-os_admin_user" {
  type        = "string"
  description = "Name of the admin user account in the virtual machine that will be accessed via SSH"
}

#Variable : ODMNode01_odm_install_dir
variable "ODMNode01_odm_install_dir" {
  type        = "string"
  description = "The installation root directory for the ODM product binaries"
  default     = "/opt/IBM/ODM891"
}

#Variable : ODMNode01_was_install_dir
variable "ODMNode01_was_install_dir" {
  type        = "string"
  description = "The installation root directory for the WebSphere Application Server product binaries"
  default     = "/opt/IBM/WebSphere/AppServer"
}

#Variable : ODMNode01_was_java_version
variable "ODMNode01_was_java_version" {
  type        = "string"
  description = "The Java SDK version that should be installed with the WebSphere Application Server. Example format is 8.0.4.70"
  default     = "7.1.4.15"
}

#Variable : ODMNode01_was_os_users_was_comment
variable "ODMNode01_was_os_users_was_comment" {
  type        = "string"
  description = "Comment that will be added when creating the userid"
  default     = "WAS administrative user"
}

#Variable : ODMNode01_was_os_users_was_gid
variable "ODMNode01_was_os_users_was_gid" {
  type        = "string"
  description = "Operating system group name that will be assigned to the product installation"
  default     = "wasgrp"
}

#Variable : ODMNode01_was_os_users_was_home
variable "ODMNode01_was_os_users_was_home" {
  type        = "string"
  description = "Home directory location for operating system user that is used for product installation"
  default     = "/home/wasadmin"
}

#Variable : ODMNode01_was_os_users_was_ldap_user
variable "ODMNode01_was_os_users_was_ldap_user" {
  type        = "string"
  description = "A flag which indicates whether to create the WebSphere user locally, or utilize an LDAP based user"
  default     = "false"
}

#Variable : ODMNode01_was_os_users_was_name
variable "ODMNode01_was_os_users_was_name" {
  type        = "string"
  description = "Operating system userid that will be used to install the product. Userid will be created if it does not exist"
  default     = "wasadmin"
}

#Variable : ODMNode01_was_profile_dir
variable "ODMNode01_was_profile_dir" {
  type        = "string"
  description = "The directory path that contains WebSphere Application Server profiles"
  default     = "/opt/IBM/WebSphere/AppServer/profiles"
}

#Variable : ODMNode01_was_profiles_standalone_profiles_standalone1_cell
variable "ODMNode01_was_profiles_standalone_profiles_standalone1_cell" {
  type        = "string"
  description = "Cell name for the application server"
  default     = "cell01"
}

#Variable : ODMNode01_was_profiles_standalone_profiles_standalone1_keystorepassword
variable "ODMNode01_was_profiles_standalone_profiles_standalone1_keystorepassword" {
  type        = "string"
  description = "Specifies the password to use on all keystore files created during profile creation"
}

#Variable : ODMNode01_was_profiles_standalone_profiles_standalone1_profile
variable "ODMNode01_was_profiles_standalone_profiles_standalone1_profile" {
  type        = "string"
  description = "Application server profile name"
  default     = "AppSrv01"
}

#Variable : ODMNode01_was_profiles_standalone_profiles_standalone1_server
variable "ODMNode01_was_profiles_standalone_profiles_standalone1_server" {
  type        = "string"
  description = "Name of the application server"
  default     = "server1"
}

#Variable : ODMNode01_was_security_admin_user
variable "ODMNode01_was_security_admin_user" {
  type        = "string"
  description = "The username for securing the WebSphere adminstrative console"
  default     = "wasadmin"
}

#Variable : ODMNode01_was_security_admin_user_pwd
variable "ODMNode01_was_security_admin_user_pwd" {
  type        = "string"
  description = "The password for the WebSphere administrative account"
}

#Variable : ODMNode01_was_version
variable "ODMNode01_was_version" {
  type        = "string"
  description = "The release and fixpack level of WebSphere Application Server to be installed. Example formats are 8.5.5.13 or 9.0.0.6"
  default     = "8.5.5.13"
}

#Variable : ODMNode01_was_wsadmin_standalone_jvmproperty_property_value_initial
variable "ODMNode01_was_wsadmin_standalone_jvmproperty_property_value_initial" {
  type        = "string"
  description = "Minimum JVM heap size"
  default     = "256"
}

#Variable : ODMNode01_was_wsadmin_standalone_jvmproperty_property_value_maximum
variable "ODMNode01_was_wsadmin_standalone_jvmproperty_property_value_maximum" {
  type        = "string"
  description = "Maximum JVM heap size"
  default     = "512"
}

#########################################################
##### Resource : ODMNode01
#########################################################

variable "ODMNode01-os_password" {
  type        = "string"
  description = "Operating System Password for the Operating System User to access virtual machine"
}

variable "ODMNode01_folder" {
  description = "Target vSphere folder for virtual machine"
}

variable "ODMNode01_datacenter" {
  description = "Target vSphere datacenter for virtual machine creation"
}

variable "ODMNode01_domain" {
  description = "Domain Name of virtual machine"
}

variable "ODMNode01_number_of_vcpu" {
  description = "Number of virtual CPU for the virtual machine, which is required to be a positive Integer"
  default     = "2"
}

variable "ODMNode01_memory" {
  description = "Memory assigned to the virtual machine in megabytes. This value is required to be an increment of 1024"
  default     = "4096"
}

variable "ODMNode01_resource_pool" {
  description = "Target vSphere Resource Pool to host the virtual machine"
}

variable "ODMNode01_dns_suffixes" {
  type        = "list"
  description = "Name resolution suffixes for the virtual network adapter"
}

variable "ODMNode01_dns_servers" {
  type        = "list"
  description = "DNS servers for the virtual network adapter"
}

variable "ODMNode01_network_interface_label" {
  description = "vSphere port group or network label for virtual machine's vNIC"
}

variable "ODMNode01_ipv4_gateway" {
  description = "IPv4 gateway for vNIC configuration"
}

variable "ODMNode01_ipv4_address" {
  description = "IPv4 address for vNIC configuration"
}

variable "ODMNode01_ipv4_prefix_length" {
  description = "IPv4 prefix length for vNIC configuration. The value must be a number between 8 and 32"
}

variable "ODMNode01_adapter_type" {
  description = "Network adapter type for vNIC Configuration"
  default     = "vmxnet3"
}

variable "ODMNode01_root_disk_datastore" {
  description = "Data store or storage cluster name for target virtual machine's disks"
}

variable "ODMNode01_root_disk_keep_on_remove" {
  type        = "string"
  description = "Delete template disk volume when the virtual machine is deleted"
  default     = "false"
}

variable "ODMNode01_root_disk_size" {
  description = "Size of template disk volume. Should be equal to template's disk size"
  default     = "100"
}

# vsphere vm
resource "vsphere_virtual_machine" "ODMNode01" {
  name             = "${var.ODMNode01-name}"
  folder           = "${var.ODMNode01_folder}"
  num_cpus         = "${var.ODMNode01_number_of_vcpu}"
  memory           = "${var.ODMNode01_memory}"
  resource_pool_id = "${data.vsphere_resource_pool.ODMNode01_resource_pool.id}"
  datastore_id     = "${data.vsphere_datastore.ODMNode01_datastore.id}"
  guest_id         = "${data.vsphere_virtual_machine.ODMNode01_template.guest_id}"
  scsi_type        = "${data.vsphere_virtual_machine.ODMNode01_template.scsi_type}"

  clone {
    template_uuid = "${data.vsphere_virtual_machine.ODMNode01_template.id}"

    customize {
      linux_options {
        domain    = "${var.ODMNode01_domain}"
        host_name = "${var.ODMNode01-name}"
      }

      network_interface {
        ipv4_address = "${var.ODMNode01_ipv4_address}"
        ipv4_netmask = "${var.ODMNode01_ipv4_prefix_length}"
      }

      ipv4_gateway    = "${var.ODMNode01_ipv4_gateway}"
      dns_suffix_list = "${var.ODMNode01_dns_suffixes}"
      dns_server_list = "${var.ODMNode01_dns_servers}"
    }
  }

  network_interface {
    network_id   = "${data.vsphere_network.ODMNode01_network.id}"
    adapter_type = "${var.ODMNode01_adapter_type}"
  }

  disk {
    label          = "${var.ODMNode01-name}.disk0"
    size           = "${var.ODMNode01_root_disk_size}"
    keep_on_remove = "${var.ODMNode01_root_disk_keep_on_remove}"
  }

  # Specify the connection
  connection {
    type     = "ssh"
    user     = "${var.ODMNode01-os_admin_user}"
    password = "${var.ODMNode01-os_password}"
  }

  provisioner "file" {
    destination = "ODMNode01_add_ssh_key.sh"

    content = <<EOF
# =================================================================
# Copyright 2017 IBM Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
#	you may not use this file except in compliance with the License.
#	You may obtain a copy of the License at
#
#	  http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
#	WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# =================================================================
#!/bin/bash

if (( $# != 3 )); then
echo "usage: arg 1 is user, arg 2 is public key, arg3 is CAMC Public Key"
exit -1
fi

userid="$1"
ssh_key="$2"
camc_ssh_key="$3"

user_home=$(eval echo "~$userid")
user_auth_key_file=$user_home/.ssh/authorized_keys
echo "$user_auth_key_file"
if ! [ -f $user_auth_key_file ]; then
echo "$user_auth_key_file does not exist on this system, creating."
mkdir $user_home/.ssh
chmod 700 $user_home/.ssh
touch $user_home/.ssh/authorized_keys
chmod 600 $user_home/.ssh/authorized_keys
else
echo "user_home : $user_home"
fi

if [[ $ssh_key = 'None' ]]; then
echo "skipping user key add, 'None' specified"
else
echo "$user_auth_key_file"
echo "$ssh_key" >> "$user_auth_key_file"
if [ $? -ne 0 ]; then
echo "failed to add to $user_auth_key_file"
exit -1
else
echo "updated $user_auth_key_file"
fi
fi

echo "$camc_ssh_key" >> "$user_auth_key_file"
if [ $? -ne 0 ]; then
echo "failed to add to $user_auth_key_file"
exit -1
else
echo "updated $user_auth_key_file"
fi

EOF
  }

  # Execute the script remotely
  provisioner "remote-exec" {
    inline = [
      "bash -c 'chmod +x ODMNode01_add_ssh_key.sh'",
      "bash -c './ODMNode01_add_ssh_key.sh  \"${var.ODMNode01-os_admin_user}\" \"${var.user_public_ssh_key}\" \"${var.ibm_pm_public_ssh_key}\">> ODMNode01_add_ssh_key.log 2>&1'",
    ]
  }
}

#########################################################
##### Resource : ODMNode01_chef_bootstrap_comp
#########################################################

resource "camc_bootstrap" "ODMNode01_chef_bootstrap_comp" {
  depends_on      = ["camc_vaultitem.VaultItem", "vsphere_virtual_machine.ODMNode01"]
  name            = "ODMNode01_chef_bootstrap_comp"
  camc_endpoint   = "${var.ibm_pm_service}/v1/bootstrap/chef"
  access_token    = "${var.ibm_pm_access_token}"
  skip_ssl_verify = true
  trace           = true

  data = <<EOT
{
  "os_admin_user": "${var.ODMNode01-os_admin_user}",
  "stack_id": "${var.ibm_stack_id}",
  "environment_name": "_default",
  "host_ip": "${vsphere_virtual_machine.ODMNode01.clone.0.customize.0.network_interface.0.ipv4_address}",
  "node_name": "${var.ODMNode01-name}",
  "node_attributes": {
    "ibm_internal": {
      "stack_id": "${var.ibm_stack_id}",
      "stack_name": "${var.ibm_stack_name}",
      "vault": {
        "item": "secrets",
        "name": "${var.ibm_stack_id}"
      }
    }
  }
}
EOT
}

#########################################################
##### Resource : ODMNode01_install
#########################################################

resource "camc_softwaredeploy" "ODMNode01_odm_was_install" {
  depends_on      = ["camc_bootstrap.ODMNode01_chef_bootstrap_comp"]
  name            = "ODMNode01_odm_basic_install"
  camc_endpoint   = "${var.ibm_pm_service}/v1/software_deployment/chef"
  access_token    = "${var.ibm_pm_access_token}"
  skip_ssl_verify = true
  trace           = true

  data = <<EOT
{
  "os_admin_user": "${var.ODMNode01-os_admin_user}",
  "stack_id": "${var.ibm_stack_id}",
  "environment_name": "_default",
  "host_ip": "${vsphere_virtual_machine.ODMNode01.clone.0.customize.0.network_interface.0.ipv4_address}",
  "node_name": "${var.ODMNode01-name}",
  "runlist": "role[odm_install_was]",
  "node_attributes": {
    "ibm": {
      "im_repo": "${var.ibm_im_repo}",
      "im_repo_user": "${var.ibm_im_repo_user}",
      "sw_repo": "${var.ibm_sw_repo}",
      "sw_repo_user": "${var.ibm_sw_repo_user}"
    },
    "ibm_internal": {
      "roles": "[odm_install_was]"
    },
    "was": {
      "profiles": {
        "standalone_profiles": {
          "standalone1": {
            "cell": "${var.ODMNode01_was_profiles_standalone_profiles_standalone1_cell}",
            "profile": "${var.ODMNode01_was_profiles_standalone_profiles_standalone1_profile}",
            "server": "${var.ODMNode01_was_profiles_standalone_profiles_standalone1_server}"
          }
        }
      },
      "wsadmin": {
        "standalone": {
          "jvmproperty": {
            "property_value_initial": "${var.ODMNode01_was_wsadmin_standalone_jvmproperty_property_value_initial}",
            "property_value_maximum": "${var.ODMNode01_was_wsadmin_standalone_jvmproperty_property_value_maximum}"
          }
        }
      },
      "install_dir": "${var.ODMNode01_was_install_dir}",
      "java_version": "${var.ODMNode01_was_java_version}",
      "os_users": {
        "was": {
          "comment": "${var.ODMNode01_was_os_users_was_comment}",
          "gid": "${var.ODMNode01_was_os_users_was_gid}",
          "home": "${var.ODMNode01_was_os_users_was_home}",
          "ldap_user": "${var.ODMNode01_was_os_users_was_ldap_user}",
          "name": "${var.ODMNode01_was_os_users_was_name}"
        }
      },
      "profile_dir": "${var.ODMNode01_was_profile_dir}",
      "security": {
        "admin_user": "${var.ODMNode01_was_security_admin_user}"
      },
      "version": "${var.ODMNode01_was_version}"
    },
    "odm": {
      "install_dir": "${var.ODMNode01_odm_install_dir}"
    }
  },
  "vault_content": {
    "item": "secrets",
    "values": {
      "ibm": {
        "im_repo_password": "${var.ibm_im_repo_password}",
        "sw_repo_password": "${var.ibm_sw_repo_password}"
      },
      "was": {
        "security": {
          "admin_user_pwd": "${var.ODMNode01_was_security_admin_user_pwd}"
        },
        "profiles": {
          "standalone_profiles": {
            "standalone1": {
              "keystorepassword": "${var.ODMNode01_was_profiles_standalone_profiles_standalone1_keystorepassword}"
            }
          }
        }
      }
    },
    "vault": "${var.ibm_stack_id}"
  }
}
EOT
}

#########################################################
##### Resource : VaultItem
#########################################################

resource "camc_vaultitem" "VaultItem" {
  camc_endpoint   = "${var.ibm_pm_service}/v1/vault_item/chef"
  access_token    = "${var.ibm_pm_access_token}"
  skip_ssl_verify = true
  trace           = true

  data = <<EOT
{
  "vault_content": {
    "item": "secrets",
    "values": {},
    "vault": "${var.ibm_stack_id}"
  }
}
EOT
}

output "ODMNode01_ip" {
  value = "VM IP Address : ${vsphere_virtual_machine.ODMNode01.clone.0.customize.0.network_interface.0.ipv4_address}"
}

output "ODMNode01_name" {
  value = "${var.ODMNode01-name}"
}

output "stack_id" {
  value = "${var.ibm_stack_id}"
}
