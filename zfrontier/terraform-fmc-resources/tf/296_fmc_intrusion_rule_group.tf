# 296 · resource fmc_intrusion_rule_group · 3. Policies
# This resource manages an Intrusion Rule Group.
# Reads models/fmc_intrusion_rule_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_296 = yamldecode(file("${path.module}/../models/fmc_intrusion_rule_group.yml"))["fmc_intrusion_rule_group"]
}

resource "fmc_intrusion_rule_group" "n296" {
  description = local.m_296["description"]
  domain = local.m_296["domain"]
  name = local.m_296["name"]
}
