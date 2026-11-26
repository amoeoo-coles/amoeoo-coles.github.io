# Sample resource intersight_openapi_process_file — reads ../models/intersight_openapi_process_file.yml
locals { m1019 = yamldecode(file("${path.module}/../models/intersight_openapi_process_file.yml"))["intersight_openapi_process_file"] }

resource "intersight_openapi_process_file" "n1019" {
  account_moid = try(local.m1019["account_moid"], null)
  additional_properties = try(local.m1019["additional_properties"], null)
  ancestors = try(local.m1019["ancestors"], null)
  class_id = try(local.m1019["class_id"], null)
  create_time = try(local.m1019["create_time"], null)
  domain_group_moid = try(local.m1019["domain_group_moid"], null)
  failure_reason = try(local.m1019["failure_reason"], null)
  file_download_status = try(local.m1019["file_download_status"], null)
  file_info = try(local.m1019["file_info"], null)
  file_processing_status = try(local.m1019["file_processing_status"], null)
  file_validation_status = try(local.m1019["file_validation_status"], null)
  id = try(local.m1019["id"], null)
  mod_time = try(local.m1019["mod_time"], null)
  moid = try(local.m1019["moid"], null)
  object_type = try(local.m1019["object_type"], null)
  organization = try(local.m1019["organization"], null)
  owners = try(local.m1019["owners"], null)
  parent = try(local.m1019["parent"], null)
  permission_resources = try(local.m1019["permission_resources"], null)
  shared_scope = try(local.m1019["shared_scope"], null)
  spec_file_path = try(local.m1019["spec_file_path"], null)
  tags = try(local.m1019["tags"], null)
  version_context = try(local.m1019["version_context"], null)
}
