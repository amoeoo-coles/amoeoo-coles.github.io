# Sample data source intersight_server_diagnostics — reads ../models/data_intersight_server_diagnostics.yml
locals { m1158 = yamldecode(file("${path.module}/../models/data_intersight_server_diagnostics.yml"))["data_intersight_server_diagnostics"] }

data "intersight_server_diagnostics" "n1158" {
  account_moid = try(local.m1158["account_moid"], null)
  action = try(local.m1158["action"], null)
  additional_properties = try(local.m1158["additional_properties"], null)
  class_id = try(local.m1158["class_id"], null)
  component_list = try(local.m1158["component_list"], null)
  create_time = try(local.m1158["create_time"], null)
  diagnostics_type = try(local.m1158["diagnostics_type"], null)
  domain_group_moid = try(local.m1158["domain_group_moid"], null)
  id = try(local.m1158["id"], null)
  mod_time = try(local.m1158["mod_time"], null)
  moid = try(local.m1158["moid"], null)
  name = try(local.m1158["name"], null)
  object_type = try(local.m1158["object_type"], null)
  owners = try(local.m1158["owners"], null)
  results = try(local.m1158["results"], null)
  shared_scope = try(local.m1158["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1158["ancestors"], null) == null ? [] : local.m1158["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "diagnostic_status" {
    for_each = try(local.m1158["diagnostic_status"], null) == null ? [] : local.m1158["diagnostic_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1158["parent"], null) == null ? [] : local.m1158["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1158["permission_resources"], null) == null ? [] : local.m1158["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "server" {
    for_each = try(local.m1158["server"], null) == null ? [] : local.m1158["server"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1158["tags"], null) == null ? [] : local.m1158["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1158["version_context"], null) == null ? [] : local.m1158["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
