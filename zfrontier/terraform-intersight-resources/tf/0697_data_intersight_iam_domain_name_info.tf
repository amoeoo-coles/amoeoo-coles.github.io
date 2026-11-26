# Sample data source intersight_iam_domain_name_info — reads ../models/data_intersight_iam_domain_name_info.yml
locals { m697 = yamldecode(file("${path.module}/../models/data_intersight_iam_domain_name_info.yml"))["data_intersight_iam_domain_name_info"] }

data "intersight_iam_domain_name_info" "n697" {
  account_moid = try(local.m697["account_moid"], null)
  action = try(local.m697["action"], null)
  additional_properties = try(local.m697["additional_properties"], null)
  class_id = try(local.m697["class_id"], null)
  create_time = try(local.m697["create_time"], null)
  domain_group_moid = try(local.m697["domain_group_moid"], null)
  domain_name = try(local.m697["domain_name"], null)
  id = try(local.m697["id"], null)
  mod_time = try(local.m697["mod_time"], null)
  moid = try(local.m697["moid"], null)
  object_type = try(local.m697["object_type"], null)
  owners = try(local.m697["owners"], null)
  record_expiry_time = try(local.m697["record_expiry_time"], null)
  results = try(local.m697["results"], null)
  shared_scope = try(local.m697["shared_scope"], null)
  status = try(local.m697["status"], null)
  txt_record = try(local.m697["txt_record"], null)
  dynamic "account" {
    for_each = try(local.m697["account"], null) == null ? [] : local.m697["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m697["ancestors"], null) == null ? [] : local.m697["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "failure_details" {
    for_each = try(local.m697["failure_details"], null) == null ? [] : local.m697["failure_details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m697["parent"], null) == null ? [] : local.m697["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m697["permission_resources"], null) == null ? [] : local.m697["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m697["tags"], null) == null ? [] : local.m697["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m697["version_context"], null) == null ? [] : local.m697["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
