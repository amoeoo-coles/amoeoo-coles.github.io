# 104 · data source sdwan_application_priority_feature_profile · 4. Feature profiles
# This data source can read the Application Priority Feature Profile .
# Reads models/data_sdwan_application_priority_feature_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_104 = yamldecode(file("${path.module}/../models/data_sdwan_application_priority_feature_profile.yml"))["data_sdwan_application_priority_feature_profile"]
}

data "sdwan_application_priority_feature_profile" "n104" {
  id   = local.m_104["id"]
  name = local.m_104["name"]
}

output "n104_data_sdwan_application_priority_feature_profile_id" {
  value = data.sdwan_application_priority_feature_profile.n104.id
}
