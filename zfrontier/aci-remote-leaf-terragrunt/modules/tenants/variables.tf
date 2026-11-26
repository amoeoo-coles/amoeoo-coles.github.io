variable "environment" { type = string }
variable "location" {
  type    = string
  default = "shared"
}

variable "fabric_ready" {
  type    = bool
  default = true
}

variable "tenant_name" {
  type    = string
  default = "tn-example"
}

variable "vrf_name" {
  type    = string
  default = "vrf-stretched"
}

variable "bd_name" {
  type    = string
  default = "bd-stretched"
}

variable "bd_subnet" {
  type    = string
  default = "198.51.100.1/24"
}
