# Sample data source intersight_virtualization_esxi_console — reads ../models/data_intersight_virtualization_esxi_console.yml
locals { m1408 = yamldecode(file("${path.module}/../models/data_intersight_virtualization_esxi_console.yml"))["data_intersight_virtualization_esxi_console"] }

data "intersight_virtualization_esxi_console" "n1408" {
  account_moid = try(local.m1408["account_moid"], null)
  additional_properties = try(local.m1408["additional_properties"], null)
  class_id = try(local.m1408["class_id"], null)
  client_ip_address = try(local.m1408["client_ip_address"], null)
  create_time = try(local.m1408["create_time"], null)
  domain_group_moid = try(local.m1408["domain_group_moid"], null)
  end_time = try(local.m1408["end_time"], null)
  id = try(local.m1408["id"], null)
  mod_time = try(local.m1408["mod_time"], null)
  moid = try(local.m1408["moid"], null)
  object_type = try(local.m1408["object_type"], null)
  owners = try(local.m1408["owners"], null)
  results = try(local.m1408["results"], null)
  role = try(local.m1408["role"], null)
  shared_scope = try(local.m1408["shared_scope"], null)
  status = try(local.m1408["status"], null)
  stream_id = try(local.m1408["stream_id"], null)
  target_name = try(local.m1408["target_name"], null)
  user_id_or_email = try(local.m1408["user_id_or_email"], null)
  dynamic "ancestors" {
    for_each = try(local.m1408["ancestors"], null) == null ? [] : local.m1408["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device_registration" {
    for_each = try(local.m1408["device_registration"], null) == null ? [] : local.m1408["device_registration"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "host" {
    for_each = try(local.m1408["host"], null) == null ? [] : local.m1408["host"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1408["parent"], null) == null ? [] : local.m1408["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1408["permission_resources"], null) == null ? [] : local.m1408["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "session" {
    for_each = try(local.m1408["session"], null) == null ? [] : local.m1408["session"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1408["tags"], null) == null ? [] : local.m1408["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target" {
    for_each = try(local.m1408["target"], null) == null ? [] : local.m1408["target"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "user" {
    for_each = try(local.m1408["user"], null) == null ? [] : local.m1408["user"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1408["version_context"], null) == null ? [] : local.m1408["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
