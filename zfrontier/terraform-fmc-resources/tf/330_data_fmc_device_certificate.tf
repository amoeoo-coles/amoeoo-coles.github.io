# 330 · data source fmc_device_certificate · 4. Devices
# This data source reads the Device Certificate. The following restrictions apply: Minimum FMC version: 7.7
# Reads models/data_fmc_device_certificate.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_330 = yamldecode(file("${path.module}/../models/data_fmc_device_certificate.yml"))["data_fmc_device_certificate"]
}

data "fmc_device_certificate" "n330" {
  certificate_enrollment_id = local.m_330["certificate_enrollment_id"]
  device_id                 = local.m_330["device_id"]
  domain                    = local.m_330["domain"]
  id                        = local.m_330["id"]
}

output "n330_data_fmc_device_certificate_id" {
  value = data.fmc_device_certificate.n330.id
}
