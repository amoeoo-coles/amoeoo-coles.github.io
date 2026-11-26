# 011 · data source mso_user · 1. Platform, identity and sites
# Data source for MSO User.
# Class: not collected · DN: not collected
# Reads models/data_mso_user.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_011 = yamldecode(file("${path.module}/../models/data_mso_user.yml"))["data_mso_user"]
}

data "mso_user" "n011" {
  username = local.m_011["username"]
}

output "n011_data_mso_user_id" {
  value = data.mso_user.n011.id
}
