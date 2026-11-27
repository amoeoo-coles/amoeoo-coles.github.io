variable "aci_url" {
  type        = string
  description = "APIC URL, for example https://apic.example.invalid. Set with TF_VAR_aci_url or ACI_URL. Placeholder: {{ apic_url }}."
  default     = "https://apic.example.invalid"
}

variable "aci_username" {
  type        = string
  description = "APIC username. Set with TF_VAR_aci_username or ACI_USERNAME. Placeholder: {{ apic_username }}."
  default     = "admin"
}

variable "aci_password" {
  type        = string
  description = "APIC password. Set with TF_VAR_aci_password or ACI_PASSWORD. Do not commit a value. Placeholder: {{ apic_password }}."
  sensitive   = true
  default     = ""
}

variable "aci_insecure" {
  type        = bool
  description = "Skip TLS verification when true. Lab convenience only."
  default     = true
}
variable "scenario" {
  type        = string
  description = "a1 = contracts required (preferred group disabled). a2 = preferred group enabled."
  default     = "a1"
  validation {
    condition     = contains(["a1", "a2"], var.scenario)
    error_message = "scenario must be a1 or a2."
  }
}
