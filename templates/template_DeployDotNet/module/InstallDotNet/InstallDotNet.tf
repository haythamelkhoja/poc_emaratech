resource "null_resource" "Copy_DotNet_script" {
provisioner "file" {
  source      = "${path.module}/script/dotnet-install.ps1"
  destination = "C:\\scripts\\dotnet-install.ps1"

  connection {
    host        = "${element(var.host, count.index)}"
    type     = "winrm"
    user     = "Administrator"
    password = "${var.admin_password}"
    agent       = "false"
  }
}
}

resource "null_resource" "InstallDotNet" {
depends_on = ["null_resource.Copy_DotNet_script"]
  provisioner "remote-exec" {
    inline = [
      "powershell.exe Set-ExecutionPolicy RemoteSigned -force",
      "powershell.exe -version 4 -ExecutionPolicy Bypass -File C:\\scripts\\dotnet-install.ps1 -Channel LTS"
    ]
    connection {
      host        = "${element(var.host, count.index)}"
      type     = "winrm"
      user     = "Administrator"
      password = "${var.admin_password}"
      agent       = "false"
    }
  }
}
