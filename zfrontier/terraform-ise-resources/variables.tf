variable "ise_url" {
  description = "ISE URL, for example https://ise.example.com"
  type        = string
  default     = "https://ise.example.com"
}

variable "ise_username" {
  description = "ISE username"
  type        = string
  default     = "admin"
}

variable "ise_password" {
  description = "ISE password. Supply at runtime (TF_VAR_ise_password) - never commit it."
  type        = string
  sensitive   = true
}

variable "ise_insecure" {
  description = "Skip TLS verification"
  type        = bool
  default     = false
}

variable "secrets" {
  description = "Secret inputs keyed \"<model>.<attribute>\" (see each model header). Supply at runtime via TF_VAR_secrets (use {} when none) - never commit them."
  type        = map(string)
  sensitive   = true
}
