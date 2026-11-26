# Sample data source intersight_kvm_session — reads ../models/data_intersight_kvm_session.yml
locals { m785 = yamldecode(file("${path.module}/../models/data_intersight_kvm_session.yml"))["data_intersight_kvm_session"] }

data "intersight_kvm_session" "n785" {
  account_moid = try(local.m785["account_moid"], null)
  additional_properties = try(local.m785["additional_properties"], null)
  class_id = try(local.m785["class_id"], null)
  client_ip_address = try(local.m785["client_ip_address"], null)
  create_time = try(local.m785["create_time"], null)
  domain_group_moid = try(local.m785["domain_group_moid"], null)
  end_time = try(local.m785["end_time"], null)
  id = try(local.m785["id"], null)
  kvm_launch_url_path = try(local.m785["kvm_launch_url_path"], null)
  kvm_session_id = try(local.m785["kvm_session_id"], null)
  mod_time = try(local.m785["mod_time"], null)
  moid = try(local.m785["moid"], null)
  object_type = try(local.m785["object_type"], null)
  one_time_password = try(var.secrets["data_intersight_kvm_session.one_time_password"], local.m785["one_time_password"])
  owners = try(local.m785["owners"], null)
  results = try(local.m785["results"], null)
  role = try(local.m785["role"], null)
  shared_scope = try(local.m785["shared_scope"], null)
  sso_supported = try(local.m785["sso_supported"], null)
  status = try(local.m785["status"], null)
  target_name = try(local.m785["target_name"], null)
  user_id_or_email = try(local.m785["user_id_or_email"], null)
  username = try(local.m785["username"], null)
  dynamic "ancestors" {
    for_each = try(local.m785["ancestors"], null) == null ? [] : local.m785["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device" {
    for_each = try(local.m785["device"], null) == null ? [] : local.m785["device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m785["parent"], null) == null ? [] : local.m785["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m785["permission_resources"], null) == null ? [] : local.m785["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "server" {
    for_each = try(local.m785["server"], null) == null ? [] : local.m785["server"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "session" {
    for_each = try(local.m785["session"], null) == null ? [] : local.m785["session"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m785["tags"], null) == null ? [] : local.m785["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "target" {
    for_each = try(local.m785["target"], null) == null ? [] : local.m785["target"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tunnel" {
    for_each = try(local.m785["tunnel"], null) == null ? [] : local.m785["tunnel"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "user" {
    for_each = try(local.m785["user"], null) == null ? [] : local.m785["user"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m785["version_context"], null) == null ? [] : local.m785["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
