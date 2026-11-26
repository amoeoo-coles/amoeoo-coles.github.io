# 435 · data source sdwan_cisco_omp_feature_template · 11. (Classic) feature templates
# This data source can read the Cisco OMP feature template.
# Reads models/data_sdwan_cisco_omp_feature_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_435 = yamldecode(file("${path.module}/../models/data_sdwan_cisco_omp_feature_template.yml"))["data_sdwan_cisco_omp_feature_template"]
}

data "sdwan_cisco_omp_feature_template" "n435" {
  id = local.m_435["id"]
  name = local.m_435["name"]
}

output "n435_data_sdwan_cisco_omp_feature_template_id" {
  value = data.sdwan_cisco_omp_feature_template.n435.id
}
