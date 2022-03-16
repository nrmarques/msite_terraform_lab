# Author: NMARQUES
# Description: Variable definitions for MSO login.

variable "mso_url" {
  type        = string
  description = "The URL of ACI MSO"
  default = "MSO_URL"
}

variable "mso_username" {
  type        = string
  description = "Username of the MSO admin user"
  default = "user"
}

variable "mso_password" {
  type        = string
  description = "Password of the MSO admin user"
  default = "pass"
}
