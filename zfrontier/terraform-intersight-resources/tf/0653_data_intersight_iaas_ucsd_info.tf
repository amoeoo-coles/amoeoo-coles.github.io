# Sample data source intersight_iaas_ucsd_info — reads ../models/data_intersight_iaas_ucsd_info.yml
locals { m653 = yamldecode(file("${path.module}/../models/data_intersight_iaas_ucsd_info.yml"))["data_intersight_iaas_ucsd_info"] }

data "intersight_iaas_ucsd_info" "n653" {
  account_moid = try(local.m653["account_moid"], null)
  additional_properties = try(local.m653["additional_properties"], null)
  class_id = try(local.m653["class_id"], null)
  create_time = try(local.m653["create_time"], null)
  device_connection_status = try(local.m653["device_connection_status"], null)
  device_id = try(local.m653["device_id"], null)
  domain_group_moid = try(local.m653["domain_group_moid"], null)
  guid = try(local.m653["guid"], null)
  host_name = try(local.m653["host_name"], null)
  id = try(local.m653["id"], null)
  ip = try(local.m653["ip"], null)
  last_backup = try(local.m653["last_backup"], null)
  mod_time = try(local.m653["mod_time"], null)
  model = try(local.m653["model"], null)
  moid = try(local.m653["moid"], null)
  node_type = try(local.m653["node_type"], null)
  object_type = try(local.m653["object_type"], null)
  owners = try(local.m653["owners"], null)
  pid = try(local.m653["pid"], null)
  platform_type = try(local.m653["platform_type"], null)
  product_name = try(local.m653["product_name"], null)
  product_vendor = try(local.m653["product_vendor"], null)
  product_version = try(local.m653["product_version"], null)
  results = try(local.m653["results"], null)
  serial = try(local.m653["serial"], null)
  shared_scope = try(local.m653["shared_scope"], null)
  status = try(local.m653["status"], null)
  dynamic "ancestors" {
    for_each = try(local.m653["ancestors"], null) == null ? [] : local.m653["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "connector_pack" {
    for_each = try(local.m653["connector_pack"], null) == null ? [] : local.m653["connector_pack"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "custom_task_info" {
    for_each = try(local.m653["custom_task_info"], null) == null ? [] : local.m653["custom_task_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device_status" {
    for_each = try(local.m653["device_status"], null) == null ? [] : local.m653["device_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "license_info" {
    for_each = try(local.m653["license_info"], null) == null ? [] : local.m653["license_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "most_run_tasks" {
    for_each = try(local.m653["most_run_tasks"], null) == null ? [] : local.m653["most_run_tasks"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m653["parent"], null) == null ? [] : local.m653["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m653["permission_resources"], null) == null ? [] : local.m653["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m653["registered_device"], null) == null ? [] : local.m653["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "system_task_info" {
    for_each = try(local.m653["system_task_info"], null) == null ? [] : local.m653["system_task_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m653["tags"], null) == null ? [] : local.m653["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ucsd_managed_infra" {
    for_each = try(local.m653["ucsd_managed_infra"], null) == null ? [] : local.m653["ucsd_managed_infra"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m653["version_context"], null) == null ? [] : local.m653["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
