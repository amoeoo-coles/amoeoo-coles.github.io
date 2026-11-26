variable "environment" { type = string }
variable "location" { type = string }

variable "tep_pool" {
  type    = string
  default = "198.51.100.0/16"
}

variable "fabric_ready" {
  type    = bool
  default = true
}

variable "wan_vrf" {
  type    = string
  default = "ACI-IPN"
}

variable "site_name" {
  type    = string
  default = "site-1"
}

variable "ndo_site_id" {
  type        = string
  description = "Existing NDO site identifier if already onboarded. Example only."
  default     = "1"
}
