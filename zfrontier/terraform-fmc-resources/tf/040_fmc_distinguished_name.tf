# 040 · resource fmc_distinguished_name · 2. Objects
# This resource manages a Distinguished Name. The following restrictions apply: Minimum FMC version: 7.4
# Reads models/fmc_distinguished_name.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_040 = yamldecode(file("${path.module}/../models/fmc_distinguished_name.yml"))["fmc_distinguished_name"]
}

resource "fmc_distinguished_name" "n040" {
  distinguished_name = local.m_040["distinguished_name"]
  domain             = local.m_040["domain"]
  name               = local.m_040["name"]
}
