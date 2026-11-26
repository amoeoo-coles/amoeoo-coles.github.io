# Sample data source intersight_sol_policy — reads ../models/data_intersight_sol_policy.yml
locals { m1210 = yamldecode(file("${path.module}/../models/data_intersight_sol_policy.yml"))["data_intersight_sol_policy"] }

data "intersight_sol_policy" "n1210" {
  account_moid = try(local.m1210["account_moid"], null)
  additional_properties = try(local.m1210["additional_properties"], null)
  baud_rate = try(local.m1210["baud_rate"], null)
  class_id = try(local.m1210["class_id"], null)
  com_port = try(local.m1210["com_port"], null)
  create_time = try(local.m1210["create_time"], null)
  description = try(local.m1210["description"], null)
  domain_group_moid = try(local.m1210["domain_group_moid"], null)
  enabled = try(local.m1210["enabled"], null)
  id = try(local.m1210["id"], null)
  mod_time = try(local.m1210["mod_time"], null)
  moid = try(local.m1210["moid"], null)
  name = try(local.m1210["name"], null)
  object_type = try(local.m1210["object_type"], null)
  owners = try(local.m1210["owners"], null)
  results = try(local.m1210["results"], null)
  shared_scope = try(local.m1210["shared_scope"], null)
  ssh_port = try(local.m1210["ssh_port"], null)
  dynamic "ancestors" {
    for_each = try(local.m1210["ancestors"], null) == null ? [] : local.m1210["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1210["organization"], null) == null ? [] : local.m1210["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1210["parent"], null) == null ? [] : local.m1210["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1210["permission_resources"], null) == null ? [] : local.m1210["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profiles" {
    for_each = try(local.m1210["profiles"], null) == null ? [] : local.m1210["profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1210["tags"], null) == null ? [] : local.m1210["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1210["version_context"], null) == null ? [] : local.m1210["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
