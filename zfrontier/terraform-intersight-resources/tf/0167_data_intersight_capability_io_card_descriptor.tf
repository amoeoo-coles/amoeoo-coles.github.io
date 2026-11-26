# Sample data source intersight_capability_io_card_descriptor — reads ../models/data_intersight_capability_io_card_descriptor.yml
locals { m167 = yamldecode(file("${path.module}/../models/data_intersight_capability_io_card_descriptor.yml"))["data_intersight_capability_io_card_descriptor"] }

data "intersight_capability_io_card_descriptor" "n167" {
  account_moid = try(local.m167["account_moid"], null)
  additional_properties = try(local.m167["additional_properties"], null)
  bif_port_num = try(local.m167["bif_port_num"], null)
  class_id = try(local.m167["class_id"], null)
  create_time = try(local.m167["create_time"], null)
  description = try(local.m167["description"], null)
  domain_group_moid = try(local.m167["domain_group_moid"], null)
  id = try(local.m167["id"], null)
  is_ucsx_direct_io_card = try(local.m167["is_ucsx_direct_io_card"], null)
  mod_time = try(local.m167["mod_time"], null)
  model = try(local.m167["model"], null)
  moid = try(local.m167["moid"], null)
  native_hif_port_channel_required = try(local.m167["native_hif_port_channel_required"], null)
  native_speed_master_port_num = try(local.m167["native_speed_master_port_num"], null)
  nr_version = try(local.m167["nr_version"], null)
  num_hif_ports = try(local.m167["num_hif_ports"], null)
  object_type = try(local.m167["object_type"], null)
  owners = try(local.m167["owners"], null)
  results = try(local.m167["results"], null)
  revision = try(local.m167["revision"], null)
  shared_scope = try(local.m167["shared_scope"], null)
  uif_connectivity = try(local.m167["uif_connectivity"], null)
  unsupported_policies = try(local.m167["unsupported_policies"], null)
  vendor = try(local.m167["vendor"], null)
  dynamic "ancestors" {
    for_each = try(local.m167["ancestors"], null) == null ? [] : local.m167["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "capabilities" {
    for_each = try(local.m167["capabilities"], null) == null ? [] : local.m167["capabilities"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m167["parent"], null) == null ? [] : local.m167["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m167["permission_resources"], null) == null ? [] : local.m167["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m167["tags"], null) == null ? [] : local.m167["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m167["version_context"], null) == null ? [] : local.m167["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
