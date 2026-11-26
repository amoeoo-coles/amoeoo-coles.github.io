variable "apic_url" { type = string }
variable "apic_username" { type = string }
variable "apic_password" {
  type      = string
  sensitive = true
}
variable "ndo_url" { type = string }
variable "ndo_username" { type = string }
variable "ndo_password" {
  type      = string
  sensitive = true
}
variable "nxos_url" { type = string }
variable "nxos_username" { type = string }
variable "nxos_password" {
  type      = string
  sensitive = true
}

provider "aci" {
  username = var.apic_username
  password = var.apic_password
  url      = var.apic_url
  insecure = true
}

provider "mso" {
  username = var.ndo_username
  password = var.ndo_password
  url      = var.ndo_url
  insecure = true
  platform = "nd"
}

provider "nxos" {
  username = var.nxos_username
  password = var.nxos_password
  url      = var.nxos_url
  insecure = true
}
