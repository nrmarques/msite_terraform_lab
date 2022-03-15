# Author: NMARQUES
# Description: Variable definitions for MSO login.

variable "mso_url" {
  type        = string
  description = "The URL of ACI MSO"
  default = "https://10.150.178.65"
}

variable "mso_username" {
  type        = string
  description = "Username of the MSO admin user"
  default = "admin"
}

variable "mso_password" {
  type        = string
  description = "Password of the MSO admin user"
  default = "cisco123"
}
