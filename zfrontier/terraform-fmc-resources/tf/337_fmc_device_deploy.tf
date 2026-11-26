# 337 · resource fmc_device_deploy · 4. Devices
# This resource is used to trigger deployment to all deployable devices on each terraform apply.
# Reads models/fmc_device_deploy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_337 = yamldecode(file("${path.module}/../models/fmc_device_deploy.yml"))["fmc_device_deploy"]
}

resource "fmc_device_deploy" "n337" {
  deployment_note = local.m_337["deployment_note"]
  device_id_list = local.m_337["device_id_list"]
  domain = local.m_337["domain"]
  ignore_warning = local.m_337["ignore_warning"]
  version = local.m_337["version"]
}
