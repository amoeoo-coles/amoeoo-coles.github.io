variable "mso_url" {
  description = "MSO / NDO URL, for example https://ndo.example.com"
  type        = string
  default     = "https://ndo.example.com"
}

variable "mso_username" {
  description = "MSO / NDO username"
  type        = string
  default     = "admin"
}

variable "mso_password" {
  description = "MSO / NDO password. Supply at runtime (TF_VAR_mso_password) - never commit it."
  type        = string
  sensitive   = true
}

variable "mso_insecure" {
  description = "Skip TLS verification (provider insecure argument)"
  type        = bool
  default     = true
}

variable "mso_domain" {
  description = "Login domain. Defaults to Local."
  type        = string
  default     = "Local"
}
