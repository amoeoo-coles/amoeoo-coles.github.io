variable "aci_url" {
  type        = string
  description = "APIC URL, for example https://apic.example.invalid. Defaults to ACI_URL."
  default     = ""
}

variable "aci_username" {
  type        = string
  description = "APIC username. Defaults to ACI_USERNAME."
  default     = ""
}

variable "aci_password" {
  type        = string
  description = "APIC password. Defaults to ACI_PASSWORD. Do not commit a value."
  sensitive   = true
  default     = ""
}

variable "aci_insecure" {
  type        = bool
  description = "Skip TLS verification when true. Defaults to ACI_INSECURE, otherwise true only as a lab convenience."
  default     = true
}

variable "tenant" {
  type        = string
  description = "Lab tenant name."
  default     = "flood_lab"
}

variable "vrf" {
  type        = string
  description = "Lab VRF name."
  default     = "flood_lab_vrf"
}

variable "manage_tenant" {
  type        = bool
  description = "Create the tenant and VRF. Set false on additional units that reuse flood_lab."
  default     = true
}

variable "scenarios" {
  description = "Map of bridge domains to create. Key is the scenario id."
  type = map(object({
    bd                                 = string
    description                        = string
    unicast_routing                    = string
    l2_unknown_unicast_flooding        = string
    l3_unknown_multicast_flooding      = string
    ipv6_l3_unknown_multicast_flooding = string
    multi_destination_flooding         = string
    arp_flooding                       = string
    pim                                = string
    clear_remote_mac_entries           = optional(string, "no")
    endpoint_move_detection_mode       = optional(string, "")
    subnet                             = optional(string)
  }))
}
