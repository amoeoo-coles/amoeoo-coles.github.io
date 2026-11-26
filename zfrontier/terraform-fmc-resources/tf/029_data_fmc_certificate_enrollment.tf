# 029 · data source fmc_certificate_enrollment · 2. Objects
# This data source reads the Certificate Enrollment.
# Reads models/data_fmc_certificate_enrollment.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_029 = yamldecode(file("${path.module}/../models/data_fmc_certificate_enrollment.yml"))["data_fmc_certificate_enrollment"]
}

data "fmc_certificate_enrollment" "n029" {
  domain = local.m_029["domain"]
  id     = local.m_029["id"]
  name   = local.m_029["name"]
}

output "n029_data_fmc_certificate_enrollment_id" {
  value = data.fmc_certificate_enrollment.n029.id
}
