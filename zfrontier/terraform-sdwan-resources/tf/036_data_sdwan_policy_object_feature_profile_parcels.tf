# 036 · data source sdwan_policy_object_feature_profile_parcels · 3. Policy objects and custom applications
# This data source can read the parcels of a Policy Object Feature Profile.
# Reads models/data_sdwan_policy_object_feature_profile_parcels.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_036 = yamldecode(file("${path.module}/../models/data_sdwan_policy_object_feature_profile_parcels.yml"))["data_sdwan_policy_object_feature_profile_parcels"]
}

data "sdwan_policy_object_feature_profile_parcels" "n036" {
  created_by         = local.m_036["created_by"]
  feature_profile_id = local.m_036["feature_profile_id"]
  parcel_names       = local.m_036["parcel_names"]
  parcel_type        = local.m_036["parcel_type"]
}

output "n036_data_sdwan_policy_object_feature_profile_parcels_id" {
  value = data.sdwan_policy_object_feature_profile_parcels.n036.id
}
