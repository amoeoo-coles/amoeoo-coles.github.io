# 116 · resource ise_trustsec_work_process_settings · 7. TrustSec
# This resource can manage a TrustSec Work Process Settings.
# Reads models/ise_trustsec_work_process_settings.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_116 = yamldecode(file("${path.module}/../models/ise_trustsec_work_process_settings.yml"))["ise_trustsec_work_process_settings"]
}

resource "ise_trustsec_work_process_settings" "n116" {
  enable_approval_workflow = local.m_116["enable_approval_workflow"]
  matrix_mode              = local.m_116["matrix_mode"]
  use_defcons              = local.m_116["use_defcons"]
}
