# Author: NMARQUES
# Description: Variable definitions for deploy

variable "schema_id" {
  type        = string
  description = "The ID of the MSO schema"
}

variable "site_id" {
  type        = string
  description = "The ID of the site"
}

variable "intersite_template" {
  type        = string
  description = "The name of the intersite template"
}

variable "site_template" {
  type        = string
  description = "The name of the site template"
}

