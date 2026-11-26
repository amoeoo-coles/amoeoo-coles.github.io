# Sample data source intersight_iam_api_key — reads ../models/data_intersight_iam_api_key.yml
locals { m689 = yamldecode(file("${path.module}/../models/data_intersight_iam_api_key.yml"))["data_intersight_iam_api_key"] }

data "intersight_iam_api_key" "n689" {
  account_moid = try(local.m689["account_moid"], null)
  additional_properties = try(local.m689["additional_properties"], null)
  admin_status = try(local.m689["admin_status"], null)
  class_id = try(local.m689["class_id"], null)
  create_time = try(local.m689["create_time"], null)
  domain_group_moid = try(local.m689["domain_group_moid"], null)
  expiry_date_time = try(local.m689["expiry_date_time"], null)
  hash_algorithm = try(local.m689["hash_algorithm"], null)
  id = try(local.m689["id"], null)
  is_never_expiring = try(local.m689["is_never_expiring"], null)
  last_used_ip = try(local.m689["last_used_ip"], null)
  last_used_time = try(local.m689["last_used_time"], null)
  mod_time = try(local.m689["mod_time"], null)
  moid = try(local.m689["moid"], null)
  object_type = try(local.m689["object_type"], null)
  oper_status = try(local.m689["oper_status"], null)
  owners = try(local.m689["owners"], null)
  private_key = try(var.secrets["data_intersight_iam_api_key.private_key"], local.m689["private_key"])
  purpose = try(local.m689["purpose"], null)
  results = try(local.m689["results"], null)
  shared_scope = try(local.m689["shared_scope"], null)
  signing_algorithm = try(local.m689["signing_algorithm"], null)
  start_time = try(local.m689["start_time"], null)
  dynamic "ancestors" {
    for_each = try(local.m689["ancestors"], null) == null ? [] : local.m689["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "key_spec" {
    for_each = try(local.m689["key_spec"], null) == null ? [] : local.m689["key_spec"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m689["parent"], null) == null ? [] : local.m689["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission" {
    for_each = try(local.m689["permission"], null) == null ? [] : local.m689["permission"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m689["permission_resources"], null) == null ? [] : local.m689["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "scope" {
    for_each = try(local.m689["scope"], null) == null ? [] : local.m689["scope"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m689["tags"], null) == null ? [] : local.m689["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "user" {
    for_each = try(local.m689["user"], null) == null ? [] : local.m689["user"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m689["version_context"], null) == null ? [] : local.m689["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
