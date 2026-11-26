# Sample data source intersight_storage_hitachi_nvm_subsystem — reads ../models/data_intersight_storage_hitachi_nvm_subsystem.yml
locals { m1245 = yamldecode(file("${path.module}/../models/data_intersight_storage_hitachi_nvm_subsystem.yml"))["data_intersight_storage_hitachi_nvm_subsystem"] }

data "intersight_storage_hitachi_nvm_subsystem" "n1245" {
  account_moid = try(local.m1245["account_moid"], null)
  additional_properties = try(local.m1245["additional_properties"], null)
  class_id = try(local.m1245["class_id"], null)
  create_time = try(local.m1245["create_time"], null)
  domain_group_moid = try(local.m1245["domain_group_moid"], null)
  host_mode = try(local.m1245["host_mode"], null)
  host_mode_options = try(local.m1245["host_mode_options"], null)
  id = try(local.m1245["id"], null)
  mod_time = try(local.m1245["mod_time"], null)
  moid = try(local.m1245["moid"], null)
  name = try(local.m1245["name"], null)
  namespace_security_setting = try(local.m1245["namespace_security_setting"], null)
  nvm_subsystem_name = try(local.m1245["nvm_subsystem_name"], null)
  nvm_subsystem_nqn = try(local.m1245["nvm_subsystem_nqn"], null)
  object_type = try(local.m1245["object_type"], null)
  owners = try(local.m1245["owners"], null)
  port_ids = try(local.m1245["port_ids"], null)
  resource_group_id = try(local.m1245["resource_group_id"], null)
  results = try(local.m1245["results"], null)
  shared_scope = try(local.m1245["shared_scope"], null)
  t10pi_mode = try(local.m1245["t10pi_mode"], null)
  virtual_nvm_subsystem_id = try(local.m1245["virtual_nvm_subsystem_id"], null)
  dynamic "ancestors" {
    for_each = try(local.m1245["ancestors"], null) == null ? [] : local.m1245["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1245["array"], null) == null ? [] : local.m1245["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "host_nqns" {
    for_each = try(local.m1245["host_nqns"], null) == null ? [] : local.m1245["host_nqns"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "namespace_paths" {
    for_each = try(local.m1245["namespace_paths"], null) == null ? [] : local.m1245["namespace_paths"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "namespaces" {
    for_each = try(local.m1245["namespaces"], null) == null ? [] : local.m1245["namespaces"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1245["parent"], null) == null ? [] : local.m1245["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1245["permission_resources"], null) == null ? [] : local.m1245["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1245["registered_device"], null) == null ? [] : local.m1245["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1245["tags"], null) == null ? [] : local.m1245["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1245["version_context"], null) == null ? [] : local.m1245["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
