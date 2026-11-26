# Sample data source intersight_hci_external_storage — reads ../models/data_intersight_hci_external_storage.yml
locals { m532 = yamldecode(file("${path.module}/../models/data_intersight_hci_external_storage.yml"))["data_intersight_hci_external_storage"] }

data "intersight_hci_external_storage" "n532" {
  account_moid = try(local.m532["account_moid"], null)
  additional_properties = try(local.m532["additional_properties"], null)
  class_id = try(local.m532["class_id"], null)
  create_time = try(local.m532["create_time"], null)
  domain_group_moid = try(local.m532["domain_group_moid"], null)
  external_storage_ext_id = try(local.m532["external_storage_ext_id"], null)
  free_capacity_bytes = try(local.m532["free_capacity_bytes"], null)
  health = try(local.m532["health"], null)
  id = try(local.m532["id"], null)
  mod_time = try(local.m532["mod_time"], null)
  moid = try(local.m532["moid"], null)
  name = try(local.m532["name"], null)
  object_type = try(local.m532["object_type"], null)
  owners = try(local.m532["owners"], null)
  pod_ext_id = try(local.m532["pod_ext_id"], null)
  pod_name = try(local.m532["pod_name"], null)
  provider_type = try(local.m532["provider_type"], null)
  realm_name = try(local.m532["realm_name"], null)
  results = try(local.m532["results"], null)
  shared_scope = try(local.m532["shared_scope"], null)
  total_capacity_bytes = try(local.m532["total_capacity_bytes"], null)
  dynamic "ancestors" {
    for_each = try(local.m532["ancestors"], null) == null ? [] : local.m532["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m532["parent"], null) == null ? [] : local.m532["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m532["permission_resources"], null) == null ? [] : local.m532["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pure_array_infos" {
    for_each = try(local.m532["pure_array_infos"], null) == null ? [] : local.m532["pure_array_infos"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pure_pod" {
    for_each = try(local.m532["pure_pod"], null) == null ? [] : local.m532["pure_pod"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pure_realm" {
    for_each = try(local.m532["pure_realm"], null) == null ? [] : local.m532["pure_realm"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m532["registered_device"], null) == null ? [] : local.m532["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_containers" {
    for_each = try(local.m532["storage_containers"], null) == null ? [] : local.m532["storage_containers"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_systems" {
    for_each = try(local.m532["storage_systems"], null) == null ? [] : local.m532["storage_systems"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m532["tags"], null) == null ? [] : local.m532["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m532["version_context"], null) == null ? [] : local.m532["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
