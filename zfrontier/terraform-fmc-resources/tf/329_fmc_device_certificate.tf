# 329 · resource fmc_device_certificate · 4. Devices
# This resource manages a Device Certificate - the enrollment of a certificate (via a certificate enrollment object) onto a device. The following restrictions apply: Minimum FMC version: 7.7
# Reads models/fmc_device_certificate.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_329 = yamldecode(file("${path.module}/../models/fmc_device_certificate.yml"))["fmc_device_certificate"]
}

resource "fmc_device_certificate" "n329" {
  certificate_enrollment_id = local.m_329["certificate_enrollment_id"]
  device_id                 = local.m_329["device_id"]
  domain                    = local.m_329["domain"]
}
