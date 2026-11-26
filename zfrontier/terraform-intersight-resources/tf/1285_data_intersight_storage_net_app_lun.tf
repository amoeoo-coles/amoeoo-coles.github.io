# Sample data source intersight_storage_net_app_lun — reads ../models/data_intersight_storage_net_app_lun.yml
locals { m1285 = yamldecode(file("${path.module}/../models/data_intersight_storage_net_app_lun.yml"))["data_intersight_storage_net_app_lun"] }

data "intersight_storage_net_app_lun" "n1285" {
  account_moid = try(local.m1285["account_moid"], null)
  additional_properties = try(local.m1285["additional_properties"], null)
  class_id = try(local.m1285["class_id"], null)
  container_state = try(local.m1285["container_state"], null)
  create_time = try(local.m1285["create_time"], null)
  description = try(local.m1285["description"], null)
  domain_group_moid = try(local.m1285["domain_group_moid"], null)
  id = try(local.m1285["id"], null)
  is_mapped = try(local.m1285["is_mapped"], null)
  key = try(var.secrets["data_intersight_storage_net_app_lun.key"], local.m1285["key"])
  mapped = try(local.m1285["mapped"], null)
  mod_time = try(local.m1285["mod_time"], null)
  moid = try(local.m1285["moid"], null)
  naa_id = try(local.m1285["naa_id"], null)
  name = try(local.m1285["name"], null)
  object_type = try(local.m1285["object_type"], null)
  os_type = try(local.m1285["os_type"], null)
  owners = try(local.m1285["owners"], null)
  path = try(local.m1285["path"], null)
  results = try(local.m1285["results"], null)
  serial = try(local.m1285["serial"], null)
  shared_scope = try(local.m1285["shared_scope"], null)
  size = try(local.m1285["size"], null)
  state = try(local.m1285["state"], null)
  svm_name = try(local.m1285["svm_name"], null)
  uuid = try(local.m1285["uuid"], null)
  volume_name = try(local.m1285["volume_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m1285["ancestors"], null) == null ? [] : local.m1285["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1285["array"], null) == null ? [] : local.m1285["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "avg_performance_metrics" {
    for_each = try(local.m1285["avg_performance_metrics"], null) == null ? [] : local.m1285["avg_performance_metrics"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "events" {
    for_each = try(local.m1285["events"], null) == null ? [] : local.m1285["events"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "host" {
    for_each = try(local.m1285["host"], null) == null ? [] : local.m1285["host"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1285["parent"], null) == null ? [] : local.m1285["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1285["permission_resources"], null) == null ? [] : local.m1285["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_container" {
    for_each = try(local.m1285["storage_container"], null) == null ? [] : local.m1285["storage_container"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_utilization" {
    for_each = try(local.m1285["storage_utilization"], null) == null ? [] : local.m1285["storage_utilization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1285["tags"], null) == null ? [] : local.m1285["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1285["version_context"], null) == null ? [] : local.m1285["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
