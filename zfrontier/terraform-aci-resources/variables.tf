variable "apic_url" {
  description = "APIC URL, for example https://apic.example.com"
  type        = string
  default     = "https://apic.example.com"
}

variable "apic_username" {
  description = "APIC username"
  type        = string
  default     = "admin"
}

variable "apic_password" {
  description = "APIC password. Supply at runtime (TF_VAR_apic_password) - never commit it."
  type        = string
  sensitive   = true
}

variable "apic_insecure" {
  description = "Skip TLS verification (provider 'insecure' argument, a string)"
  type        = string
  default     = "true"
}
