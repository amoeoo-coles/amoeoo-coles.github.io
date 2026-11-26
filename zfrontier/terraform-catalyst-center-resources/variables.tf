variable "catalystcenter_url" {
  description = "Catalyst Center URL, for example https://catalystcenter.example.com"
  type        = string
  default     = "https://catalystcenter.example.com"
}

variable "catalystcenter_username" {
  description = "Catalyst Center username"
  type        = string
  default     = "admin"
}

variable "catalystcenter_password" {
  description = "Catalyst Center password. Supply at runtime (TF_VAR_catalystcenter_password) - never commit it."
  type        = string
  sensitive   = true
}

variable "catalystcenter_insecure" {
  description = "Skip TLS verification"
  type        = bool
  default     = false
}

variable "secrets" {
  description = "Secret inputs keyed \"<model>.<attribute>\" (see each model header). Supply at runtime via TF_VAR_secrets (use {} when none) - never commit them."
  type        = map(string)
  sensitive   = true
}
