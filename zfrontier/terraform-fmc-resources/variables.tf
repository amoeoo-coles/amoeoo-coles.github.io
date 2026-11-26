variable "fmc_url" {
  description = "FMC URL, for example https://fmc.example.com"
  type        = string
  default     = "https://fmc.example.com"
}

variable "fmc_username" {
  description = "FMC username"
  type        = string
  default     = "admin"
}

variable "fmc_password" {
  description = "FMC password. Supply at runtime (TF_VAR_fmc_password) - never commit it."
  type        = string
  sensitive   = true
}

variable "fmc_insecure" {
  description = "Skip TLS verification"
  type        = bool
  default     = false
}

variable "secrets" {
  description = "Secret inputs keyed \"<model>.<attribute>\" (see each model header). Supply at runtime via TF_VAR_secrets (use {} when none) - never commit them."
  type        = map(string)
  sensitive   = true
}
