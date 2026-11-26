variable "nxos_url" {
  description = "NX-API URL of the NX-OS switch, for example https://leaf1.example.com"
  type        = string
}

variable "nxos_username" {
  type = string
}

variable "nxos_password" {
  type      = string
  sensitive = true
}

variable "ndfc_url" {
  description = "Nexus Dashboard URL, for example https://nd.example.com"
  type        = string
}

variable "ndfc_username" {
  type = string
}

variable "ndfc_password" {
  type      = string
  sensitive = true
}

variable "ndfc_domain" {
  type    = string
  default = "local"
}

variable "insecure" {
  description = "Skip TLS verification (lab only)"
  type        = bool
  default     = false
}

variable "ndfc_switch_username" {
  description = "Switch discovery username used by ndfc_inventory_devices"
  type        = string
  default     = null
}

variable "ndfc_switch_password" {
  description = "Switch discovery password used by ndfc_inventory_devices"
  type        = string
  sensitive   = true
  default     = null
}
