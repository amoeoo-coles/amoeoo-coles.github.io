variable "sdwan_url" {
  description = "SD-WAN Manager URL, for example https://sdwan.example.com"
  type        = string
  default     = "https://sdwan.example.com"
}

variable "sdwan_username" {
  description = "SD-WAN Manager username"
  type        = string
  default     = "admin"
}

variable "sdwan_password" {
  description = "SD-WAN Manager password. Supply at runtime (TF_VAR_sdwan_password) - never commit it."
  type        = string
  sensitive   = true
}

variable "sdwan_insecure" {
  description = "Skip TLS verification"
  type        = bool
  default     = false
}

variable "secrets" {
  description = "Secret inputs keyed \"<model>.<attribute>\" (see each model header). Supply at runtime via TF_VAR_secrets (use {} when none) - never commit them."
  type        = map(string)
  sensitive   = true
}
