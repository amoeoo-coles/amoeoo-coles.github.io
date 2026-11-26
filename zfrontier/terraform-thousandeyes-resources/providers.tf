# Provider configuration for the catalogue (thousandeyes/thousandeyes 3.3.0).
# The bearer token comes from a variable only (TF_VAR_thousandeyes_token).

terraform {
  required_version = ">= 1.8.0"
  required_providers {
    thousandeyes = {
      source  = "thousandeyes/thousandeyes"
      version = "3.3.0"
    }
  }
}

provider "thousandeyes" {
  token            = var.thousandeyes_token
  account_group_id = var.thousandeyes_account_group_id
}
