variable "secrets" {
  description = "Secret inputs keyed \"<model>.<attribute>\". Supply at runtime via TF_VAR_secrets (use {} when none) — never commit them."
  type        = map(string)
  sensitive   = true
  default     = {}
}
