# 002 · data source mso_label · 1. Platform, identity and sites
# Data source for MSO Label
# Class: not collected · DN: not collected
# Reads models/data_mso_label.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_002 = yamldecode(file("${path.module}/../models/data_mso_label.yml"))["data_mso_label"]
}

data "mso_label" "n002" {
  label = local.m_002["label"]
}

output "n002_data_mso_label_id" {
  value = data.mso_label.n002.id
}
