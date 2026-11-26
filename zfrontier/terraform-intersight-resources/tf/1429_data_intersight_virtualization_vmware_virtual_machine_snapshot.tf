# Sample data source intersight_virtualization_vmware_virtual_machine_snapshot — reads ../models/data_intersight_virtualization_vmware_virtual_machine_snapshot.yml
locals { m1429 = yamldecode(file("${path.module}/../models/data_intersight_virtualization_vmware_virtual_machine_snapshot.yml"))["data_intersight_virtualization_vmware_virtual_machine_snapshot"] }

data "intersight_virtualization_vmware_virtual_machine_snapshot" "n1429" {
  account_moid = try(local.m1429["account_moid"], null)
  additional_properties = try(local.m1429["additional_properties"], null)
  class_id = try(local.m1429["class_id"], null)
  create_time = try(local.m1429["create_time"], null)
  creation_time = try(local.m1429["creation_time"], null)
  current_snapshot = try(local.m1429["current_snapshot"], null)
  description = try(local.m1429["description"], null)
  domain_group_moid = try(local.m1429["domain_group_moid"], null)
  golden = try(local.m1429["golden"], null)
  id = try(local.m1429["id"], null)
  identity = try(local.m1429["identity"], null)
  key = try(var.secrets["data_intersight_virtualization_vmware_virtual_machine_snapshot.key"], local.m1429["key"])
  mod_time = try(local.m1429["mod_time"], null)
  moid = try(local.m1429["moid"], null)
  name = try(local.m1429["name"], null)
  object_type = try(local.m1429["object_type"], null)
  owners = try(local.m1429["owners"], null)
  predecessor_id = try(local.m1429["predecessor_id"], null)
  quiesced = try(local.m1429["quiesced"], null)
  ref_value = try(local.m1429["ref_value"], null)
  results = try(local.m1429["results"], null)
  shared_scope = try(local.m1429["shared_scope"], null)
  snapshot_size = try(local.m1429["snapshot_size"], null)
  dynamic "ancestors" {
    for_each = try(local.m1429["ancestors"], null) == null ? [] : local.m1429["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1429["parent"], null) == null ? [] : local.m1429["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1429["permission_resources"], null) == null ? [] : local.m1429["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1429["registered_device"], null) == null ? [] : local.m1429["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1429["tags"], null) == null ? [] : local.m1429["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1429["version_context"], null) == null ? [] : local.m1429["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "virtual_machine" {
    for_each = try(local.m1429["virtual_machine"], null) == null ? [] : local.m1429["virtual_machine"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
