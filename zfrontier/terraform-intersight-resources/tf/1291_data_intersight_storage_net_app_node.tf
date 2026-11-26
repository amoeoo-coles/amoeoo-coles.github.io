# Sample data source intersight_storage_net_app_node — reads ../models/data_intersight_storage_net_app_node.yml
locals { m1291 = yamldecode(file("${path.module}/../models/data_intersight_storage_net_app_node.yml"))["data_intersight_storage_net_app_node"] }

data "intersight_storage_net_app_node" "n1291" {
  account_moid = try(local.m1291["account_moid"], null)
  additional_properties = try(local.m1291["additional_properties"], null)
  cdpd_enabled = try(local.m1291["cdpd_enabled"], null)
  class_id = try(local.m1291["class_id"], null)
  create_time = try(local.m1291["create_time"], null)
  device_mo_id = try(local.m1291["device_mo_id"], null)
  dn = try(local.m1291["dn"], null)
  domain_group_moid = try(local.m1291["domain_group_moid"], null)
  health = try(local.m1291["health"], null)
  id = try(local.m1291["id"], null)
  is_upgraded = try(local.m1291["is_upgraded"], null)
  key = try(var.secrets["data_intersight_storage_net_app_node.key"], local.m1291["key"])
  mod_time = try(local.m1291["mod_time"], null)
  model = try(local.m1291["model"], null)
  moid = try(local.m1291["moid"], null)
  name = try(local.m1291["name"], null)
  nr_version = try(local.m1291["nr_version"], null)
  object_type = try(local.m1291["object_type"], null)
  operational_mode = try(local.m1291["operational_mode"], null)
  owners = try(local.m1291["owners"], null)
  presence = try(local.m1291["presence"], null)
  results = try(local.m1291["results"], null)
  revision = try(local.m1291["revision"], null)
  rn = try(local.m1291["rn"], null)
  serial = try(local.m1291["serial"], null)
  shared_scope = try(local.m1291["shared_scope"], null)
  state = try(local.m1291["state"], null)
  status = try(local.m1291["status"], null)
  systemid = try(local.m1291["systemid"], null)
  uuid = try(local.m1291["uuid"], null)
  vendor = try(local.m1291["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m1291["ancestors"], null) == null ? [] : local.m1291["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1291["array"], null) == null ? [] : local.m1291["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "avg_performance_metrics" {
    for_each = try(local.m1291["avg_performance_metrics"], null) == null ? [] : local.m1291["avg_performance_metrics"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "events" {
    for_each = try(local.m1291["events"], null) == null ? [] : local.m1291["events"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "high_availability" {
    for_each = try(local.m1291["high_availability"], null) == null ? [] : local.m1291["high_availability"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1291["parent"], null) == null ? [] : local.m1291["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1291["permission_resources"], null) == null ? [] : local.m1291["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m1291["previous_fru"], null) == null ? [] : local.m1291["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1291["tags"], null) == null ? [] : local.m1291["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1291["version_context"], null) == null ? [] : local.m1291["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
