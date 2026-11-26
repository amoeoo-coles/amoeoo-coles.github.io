# 309 · resource fmc_chassis · 4. Devices
# This resource manages a Chassis.
# Reads models/fmc_chassis.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_309 = yamldecode(file("${path.module}/../models/fmc_chassis.yml"))["fmc_chassis"]
}

resource "fmc_chassis" "n309" {
  deploy_on_destroy = local.m_309["deploy_on_destroy"]
  device_group_id   = local.m_309["device_group_id"]
  domain            = local.m_309["domain"]
  host              = local.m_309["host"]
  name              = local.m_309["name"]
  nat_id            = local.m_309["nat_id"]
  registration_key  = try(var.secrets["fmc_chassis.registration_key"], local.m_309["registration_key"])
}
