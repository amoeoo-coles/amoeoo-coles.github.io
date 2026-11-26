# Sample data source intersight_niatelemetry_fabric — reads ../models/data_intersight_niatelemetry_fabric.yml
locals { m951 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_fabric.yml"))["data_intersight_niatelemetry_fabric"] }

data "intersight_niatelemetry_fabric" "n951" {
  account_moid = try(local.m951["account_moid"], null)
  additional_properties = try(local.m951["additional_properties"], null)
  class_id = try(local.m951["class_id"], null)
  create_time = try(local.m951["create_time"], null)
  domain_group_moid = try(local.m951["domain_group_moid"], null)
  fabric_type = try(local.m951["fabric_type"], null)
  id = try(local.m951["id"], null)
  license_tier = try(local.m951["license_tier"], null)
  mod_time = try(local.m951["mod_time"], null)
  moid = try(local.m951["moid"], null)
  name = try(local.m951["name"], null)
  network_count = try(local.m951["network_count"], null)
  object_type = try(local.m951["object_type"], null)
  owner_cluster_name = try(local.m951["owner_cluster_name"], null)
  owners = try(local.m951["owners"], null)
  power_status = try(local.m951["power_status"], null)
  power_unit = try(local.m951["power_unit"], null)
  power_value = try(local.m951["power_value"], null)
  results = try(local.m951["results"], null)
  security_domain = try(local.m951["security_domain"], null)
  shared_scope = try(local.m951["shared_scope"], null)
  telemetry_enabled = try(local.m951["telemetry_enabled"], null)
  vrf_count = try(local.m951["vrf_count"], null)
  dynamic "advisories" {
    for_each = try(local.m951["advisories"], null) == null ? [] : local.m951["advisories"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m951["ancestors"], null) == null ? [] : local.m951["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster" {
    for_each = try(local.m951["cluster"], null) == null ? [] : local.m951["cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m951["parent"], null) == null ? [] : local.m951["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m951["permission_resources"], null) == null ? [] : local.m951["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m951["registered_device"], null) == null ? [] : local.m951["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m951["tags"], null) == null ? [] : local.m951["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m951["version_context"], null) == null ? [] : local.m951["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
