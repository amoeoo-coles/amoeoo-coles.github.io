# Sample data source intersight_smtp_policy_test — reads ../models/data_intersight_smtp_policy_test.yml
locals { m1171 = yamldecode(file("${path.module}/../models/data_intersight_smtp_policy_test.yml"))["data_intersight_smtp_policy_test"] }

data "intersight_smtp_policy_test" "n1171" {
  account_moid = try(local.m1171["account_moid"], null)
  additional_properties = try(local.m1171["additional_properties"], null)
  class_id = try(local.m1171["class_id"], null)
  create_time = try(local.m1171["create_time"], null)
  domain_group_moid = try(local.m1171["domain_group_moid"], null)
  enabled = try(local.m1171["enabled"], null)
  id = try(local.m1171["id"], null)
  last_status_details = try(local.m1171["last_status_details"], null)
  last_successful_attempt_time = try(local.m1171["last_successful_attempt_time"], null)
  last_successful_policy = try(local.m1171["last_successful_policy"], null)
  last_test_status = try(local.m1171["last_test_status"], null)
  mod_time = try(local.m1171["mod_time"], null)
  moid = try(local.m1171["moid"], null)
  object_type = try(local.m1171["object_type"], null)
  owners = try(local.m1171["owners"], null)
  recipients = try(local.m1171["recipients"], null)
  results = try(local.m1171["results"], null)
  shared_scope = try(local.m1171["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m1171["account"], null) == null ? [] : local.m1171["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m1171["ancestors"], null) == null ? [] : local.m1171["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1171["parent"], null) == null ? [] : local.m1171["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1171["permission_resources"], null) == null ? [] : local.m1171["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "policy" {
    for_each = try(local.m1171["policy"], null) == null ? [] : local.m1171["policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1171["tags"], null) == null ? [] : local.m1171["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1171["version_context"], null) == null ? [] : local.m1171["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
