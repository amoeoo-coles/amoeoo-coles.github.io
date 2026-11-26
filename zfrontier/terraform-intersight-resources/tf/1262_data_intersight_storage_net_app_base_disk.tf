# Sample data source intersight_storage_net_app_base_disk — reads ../models/data_intersight_storage_net_app_base_disk.yml
locals { m1262 = yamldecode(file("${path.module}/../models/data_intersight_storage_net_app_base_disk.yml"))["data_intersight_storage_net_app_base_disk"] }

data "intersight_storage_net_app_base_disk" "n1262" {
  account_moid = try(local.m1262["account_moid"], null)
  additional_properties = try(local.m1262["additional_properties"], null)
  base_disk_model = try(local.m1262["base_disk_model"], null)
  class_id = try(local.m1262["class_id"], null)
  cluster_uuid = try(local.m1262["cluster_uuid"], null)
  container_type = try(local.m1262["container_type"], null)
  create_time = try(local.m1262["create_time"], null)
  device_mo_id = try(local.m1262["device_mo_id"], null)
  disk_bay = try(local.m1262["disk_bay"], null)
  disk_serial_number = try(local.m1262["disk_serial_number"], null)
  disk_shelf_id = try(local.m1262["disk_shelf_id"], null)
  disk_shelf_model = try(local.m1262["disk_shelf_model"], null)
  disk_shelf_name = try(local.m1262["disk_shelf_name"], null)
  disk_type = try(local.m1262["disk_type"], null)
  dn = try(local.m1262["dn"], null)
  domain_group_moid = try(local.m1262["domain_group_moid"], null)
  id = try(local.m1262["id"], null)
  is_upgraded = try(local.m1262["is_upgraded"], null)
  mod_time = try(local.m1262["mod_time"], null)
  model = try(local.m1262["model"], null)
  moid = try(local.m1262["moid"], null)
  name = try(local.m1262["name"], null)
  node_name = try(local.m1262["node_name"], null)
  nr_version = try(local.m1262["nr_version"], null)
  object_type = try(local.m1262["object_type"], null)
  owners = try(local.m1262["owners"], null)
  part_number = try(local.m1262["part_number"], null)
  presence = try(local.m1262["presence"], null)
  protocol = try(local.m1262["protocol"], null)
  results = try(local.m1262["results"], null)
  revision = try(local.m1262["revision"], null)
  rn = try(local.m1262["rn"], null)
  serial = try(local.m1262["serial"], null)
  shared_scope = try(local.m1262["shared_scope"], null)
  speed = try(local.m1262["speed"], null)
  state = try(local.m1262["state"], null)
  status = try(local.m1262["status"], null)
  type = try(local.m1262["type"], null)
  uuid = try(local.m1262["uuid"], null)
  vendor = try(local.m1262["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m1262["ancestors"], null) == null ? [] : local.m1262["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1262["array"], null) == null ? [] : local.m1262["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array_controller" {
    for_each = try(local.m1262["array_controller"], null) == null ? [] : local.m1262["array_controller"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "disk_pool" {
    for_each = try(local.m1262["disk_pool"], null) == null ? [] : local.m1262["disk_pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "events" {
    for_each = try(local.m1262["events"], null) == null ? [] : local.m1262["events"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1262["parent"], null) == null ? [] : local.m1262["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1262["permission_resources"], null) == null ? [] : local.m1262["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m1262["previous_fru"], null) == null ? [] : local.m1262["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_utilization" {
    for_each = try(local.m1262["storage_utilization"], null) == null ? [] : local.m1262["storage_utilization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1262["tags"], null) == null ? [] : local.m1262["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1262["version_context"], null) == null ? [] : local.m1262["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
