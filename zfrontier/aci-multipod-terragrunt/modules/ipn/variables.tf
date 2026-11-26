variable "environment" { type = string }
variable "location" {
  type    = string
  default = "shared"
}

variable "tep_pool" {
  type    = string
  default = "10.10.0.0/16"
}

variable "fabric_ready" {
  type    = bool
  default = true
}

variable "wan_vrf" {
  type        = string
  description = "IPN/ISN VRF name"
  default     = "ACI-IPN"
}

variable "infra_vlan" {
  type    = number
  default = 3967
}
