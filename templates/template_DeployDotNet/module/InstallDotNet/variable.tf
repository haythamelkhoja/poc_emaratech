variable "admin_password" {
  description = "Windows admin password"
  default = "Passw0rd"
}

variable "host" {
  type = "list"
  description = "Hostname or IP of Windows server"

}
