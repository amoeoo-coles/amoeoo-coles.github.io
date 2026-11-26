# Sample data source intersight_vmrc_console — reads ../models/data_intersight_vmrc_console.yml
locals { m1436 = yamldecode(file("${path.module}/../models/data_intersight_vmrc_console.yml"))["data_intersight_vmrc_console"] }

data "intersight_vmrc_console" "n1436" {
  account_moid = try(local.m1436["account_moid"], null)
  additional_properties = try(local.m1436["additional_properties"], null)
  class_id = try(local.m1436["class_id"], null)
  client_ip_address = try(local.m1436["client_ip_address"], null)
  client_url = try(local.m1436["client_url"], null)
  create_time = try(local.m1436["create_time"], null)
  domain_group_moid = try(local.m1436["domain_group_moid"], null)
  end_time = try(local.m1436["end_time"], null)
  id = try(local.m1436["id"], null)
  mod_time = try(local.m1436["mod_time"], null)
  moid = try(local.m1436["moid"], null)
  object_type = try(local.m1436["object_type"], null)
  owners = try(local.m1436["owners"], null)
  results = try(local.m1436["results"], null)
  role = try(local.m1436["role"], null)
  shared_scope = try(local.m1436["shared_scope"], null)
  status = try(local.m1436["status"], null)
  target_name = try(local.m1436["target_name"], null)
  user_id_or_email = try(local.m1436["user_id_or_email"], null)
  dynamic "ancestors" {
    for_each = try(local.m1436["ancestors"], null) == null ? [] : local.m1436["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1436["parent"], null) == null ? [] : local.m1436["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1436["permission_resources"], null) == null ? [] : local.m1436["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "session" {
    for_each = try(local.m1436["session"], null) == null ? [] : local.m1436["session"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1436["tags"], null) == null ? [] : local.m1436["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target" {
    for_each = try(local.m1436["target"], null) == null ? [] : local.m1436["target"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "user" {
    for_each = try(local.m1436["user"], null) == null ? [] : local.m1436["user"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vcenter" {
    for_each = try(local.m1436["vcenter"], null) == null ? [] : local.m1436["vcenter"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1436["version_context"], null) == null ? [] : local.m1436["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "virtual_machine" {
    for_each = try(local.m1436["virtual_machine"], null) == null ? [] : local.m1436["virtual_machine"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
