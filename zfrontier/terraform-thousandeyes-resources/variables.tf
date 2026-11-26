variable "thousandeyes_token" {
  description = "ThousandEyes API bearer token. Supply at runtime (TF_VAR_thousandeyes_token) - never commit it."
  type        = string
  sensitive   = true
}

variable "thousandeyes_account_group_id" {
  description = "Account group ID (optional; the token's default account group when null)"
  type        = string
  default     = null
}

variable "secrets" {
  description = "Secret inputs keyed \"<model>.<attribute>\" (see each model header). Supply at runtime via TF_VAR_secrets (use {} when none) - never commit them."
  type        = map(string)
  sensitive   = true
}
