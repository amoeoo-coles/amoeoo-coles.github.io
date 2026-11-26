# Sample data source intersight_kvm_tunnel — reads ../models/data_intersight_kvm_tunnel.yml
locals { m786 = yamldecode(file("${path.module}/../models/data_intersight_kvm_tunnel.yml"))["data_intersight_kvm_tunnel"] }

data "intersight_kvm_tunnel" "n786" {
  account_moid = try(local.m786["account_moid"], null)
  additional_properties = try(local.m786["additional_properties"], null)
  class_id = try(local.m786["class_id"], null)
  client_ip_address = try(local.m786["client_ip_address"], null)
  client_url = try(local.m786["client_url"], null)
  create_time = try(local.m786["create_time"], null)
  domain_group_moid = try(local.m786["domain_group_moid"], null)
  end_time = try(local.m786["end_time"], null)
  id = try(local.m786["id"], null)
  mod_time = try(local.m786["mod_time"], null)
  moid = try(local.m786["moid"], null)
  object_type = try(local.m786["object_type"], null)
  owners = try(local.m786["owners"], null)
  results = try(local.m786["results"], null)
  role = try(local.m786["role"], null)
  shared_scope = try(local.m786["shared_scope"], null)
  status = try(local.m786["status"], null)
  target_name = try(local.m786["target_name"], null)
  user_id_or_email = try(local.m786["user_id_or_email"], null)
  dynamic "ancestors" {
    for_each = try(local.m786["ancestors"], null) == null ? [] : local.m786["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device" {
    for_each = try(local.m786["device"], null) == null ? [] : local.m786["device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "kvm_session" {
    for_each = try(local.m786["kvm_session"], null) == null ? [] : local.m786["kvm_session"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m786["parent"], null) == null ? [] : local.m786["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m786["permission_resources"], null) == null ? [] : local.m786["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "server" {
    for_each = try(local.m786["server"], null) == null ? [] : local.m786["server"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "session" {
    for_each = try(local.m786["session"], null) == null ? [] : local.m786["session"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m786["tags"], null) == null ? [] : local.m786["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target" {
    for_each = try(local.m786["target"], null) == null ? [] : local.m786["target"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "user" {
    for_each = try(local.m786["user"], null) == null ? [] : local.m786["user"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m786["version_context"], null) == null ? [] : local.m786["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
