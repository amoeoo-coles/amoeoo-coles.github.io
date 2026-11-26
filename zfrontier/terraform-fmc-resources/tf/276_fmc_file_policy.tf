# 276 · resource fmc_file_policy · 3. Policies
# This resource manages File Policy with corresponding rules. The following restrictions apply: Read operations are supported by any tested FMC versionMinimum FMC version for object management (Create/Update/Delete): 7.4
# Reads models/fmc_file_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_276 = yamldecode(file("${path.module}/../models/fmc_file_policy.yml"))["fmc_file_policy"]
}

resource "fmc_file_policy" "n276" {
  block_encrypted_archives     = local.m_276["block_encrypted_archives"]
  block_uninspectable_archives = local.m_276["block_uninspectable_archives"]
  clean_list                   = local.m_276["clean_list"]
  custom_detection_list        = local.m_276["custom_detection_list"]
  description                  = local.m_276["description"]
  domain                       = local.m_276["domain"]
  file_rules                   = local.m_276["file_rules"]
  first_time_file_analysis     = local.m_276["first_time_file_analysis"]
  inspect_archives             = local.m_276["inspect_archives"]
  max_archive_depth            = local.m_276["max_archive_depth"]
  name                         = local.m_276["name"]
  threat_score                 = local.m_276["threat_score"]
}
