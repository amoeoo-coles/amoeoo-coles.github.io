# Sample resource intersight_iam_domain_name_info — reads ../models/intersight_iam_domain_name_info.yml
locals { m662 = yamldecode(file("${path.module}/../models/intersight_iam_domain_name_info.yml"))["intersight_iam_domain_name_info"] }

resource "intersight_iam_domain_name_info" "n662" {
  account = try(local.m662["account"], null)
  account_moid = try(local.m662["account_moid"], null)
  action = try(local.m662["action"], null)
  additional_properties = try(local.m662["additional_properties"], null)
  ancestors = try(local.m662["ancestors"], null)
  class_id = try(local.m662["class_id"], null)
  create_time = try(local.m662["create_time"], null)
  domain_group_moid = try(local.m662["domain_group_moid"], null)
  domain_name = try(local.m662["domain_name"], null)
  failure_details = try(local.m662["failure_details"], null)
  id = try(local.m662["id"], null)
  mod_time = try(local.m662["mod_time"], null)
  moid = try(local.m662["moid"], null)
  object_type = try(local.m662["object_type"], null)
  owners = try(local.m662["owners"], null)
  parent = try(local.m662["parent"], null)
  permission_resources = try(local.m662["permission_resources"], null)
  record_expiry_time = try(local.m662["record_expiry_time"], null)
  shared_scope = try(local.m662["shared_scope"], null)
  status = try(local.m662["status"], null)
  tags = try(local.m662["tags"], null)
  txt_record = try(local.m662["txt_record"], null)
  version_context = try(local.m662["version_context"], null)
}
