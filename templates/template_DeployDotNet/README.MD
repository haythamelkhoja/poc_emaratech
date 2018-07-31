# DotNet Installation
### Install the latest long-term supported (LTS) version
Copyright IBM Corp. 2018, 2018.

## Warning

- Built for a POC Only with minimal testing.

## Description

This template will deploy a Windows VM and Install dotnet LTS.

## Integration Method

Script Remote, executes on the remote host.

## Prerequisites

- Windows VM template with winrm enable.
- Windows VM administrator access.

## Commands to enable winrm on windows.
- cmd.exe /c winrm quickconfig -q
- cmd.exe /c winrm quickconfig '-transport:http'
- cmd.exe /c winrm set "winrm/config" '@{MaxTimeoutms="7200000"}'
- cmd.exe /c winrm set "winrm/config/winrs" '@{MaxMemoryPerShellMB="1024"}'
- cmd.exe /c winrm set "winrm/config/service" '@{AllowUnencrypted="true"}'
- cmd.exe /c winrm set "winrm/config/client" '@{AllowUnencrypted="true"}'
- cmd.exe /c winrm set "winrm/config/service/auth" '@{Basic="true"}'
- cmd.exe /c winrm set "winrm/config/client/auth" '@{Basic="true"}'
- cmd.exe /c winrm set "winrm/config/service/auth" '@{CredSSP="true"}'
- cmd.exe /c winrm set "winrm/config/listener?Address=*+Transport=HTTP" '@{Port="5985"}'
- cmd.exe /c netsh advfirewall firewall set rule group="remote administration" new enable=yes
- cmd.exe /c netsh firewall add portopening TCP 5985 "Port 5985"
- cmd.exe /c net stop winrm
- cmd.exe /c sc config winrm start= auto
- cmd.exe /c net start winrm
- cmd.exe /c net user Administrator "REDACTED"
- cmd.exe /c wmic useraccount where "name='Administrator'" set PasswordExpires=FALSE

## Input Parameters

<table>
  <tr>
    <th>Variable</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>vsphere_domain</td>
    <td>vCenter networking domain (Eg ibm.com)</td>
  </tr>
  <tr>
    <td>dns_servers</td>
    <td>vCenter comma-separated primary, secondary networking DNS.</td>
  </tr>
  <tr>
    <td>vm_vcpu</td>
    <td>VM vCPU count.</td>
  </tr>
  <tr>
    <td>vm_memory</td>
    <td>VM memory</td>
  </tr>
  <tr>
    <td>vm_hostName</td>
    <td>List of host name to assign to generated nodes.</td>
  </tr>
  <tr>
    <td>vm_network_ips</td>
    <td>List of public IP's to assign to generated nodes.</td>
  </tr>
  <tr>
    <td>admin_password</td>
    <td>Windows admin passw0rd</td>
  </tr>
  <tr>
    <td>vm_network_subNet</td>
    <td>Public network prefix length</td>
  </tr>
  <tr>
    <td>vm_network_gateway</td>
    <td>vCenter networking gateway</td>
  </tr>
  <tr>
    <td>folderPath</td>
    <td>folder path to deploy the vm</td>
  </tr>
  <tr>
    <td>vsphere_cluster</td>
    <td>VC Cluster to use for deployment</td>
  </tr>
  <tr>
    <td>vsphere_datastore</td>
    <td>VC DS to use for deployment</td>
  </tr>
  <tr>
    <td>vsphere_datacenter</td>
    <td>VC DC to use for deployment</td>
  </tr>
  <tr>
    <td>network_portGroup</td>
    <td>VC Network Port Group to use for deployment (Default is VM Network)</td>
  </tr>
  <tr>
    <td>template</td>
    <td>Path to the VMware template to use to create resources.</td>
  </tr>
  <tr>
    <td>vmName</td>
    <td>VC display name of VM</td>
  </tr>
</table>
