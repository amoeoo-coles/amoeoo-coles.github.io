# 001 · resource mso_label · 1. Platform, identity and sites
# Manages MSO Resource Label
# Class: not collected · DN: not collected
# Reads models/mso_label.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_001 = yamldecode(file("${path.module}/../models/mso_label.yml"))["mso_label"]
}

resource "mso_label" "n001" {
  label = local.m_001["label"]
  type  = local.m_001["type"]
}
