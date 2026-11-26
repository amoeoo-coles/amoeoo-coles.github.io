# 028 · data source ise_profiler_profile · 4. Profiling
# This data source can read profiling policies.
# Reads models/data_ise_profiler_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_028 = yamldecode(file("${path.module}/../models/data_ise_profiler_profile.yml"))["data_ise_profiler_profile"]
}

data "ise_profiler_profile" "n028" {
  id = local.m_028["id"]
  name = local.m_028["name"]
}

output "n028_data_ise_profiler_profile_id" {
  value = data.ise_profiler_profile.n028.id
}
