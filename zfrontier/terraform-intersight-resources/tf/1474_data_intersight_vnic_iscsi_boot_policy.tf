# Sample data source intersight_vnic_iscsi_boot_policy — reads ../models/data_intersight_vnic_iscsi_boot_policy.yml
locals { m1474 = yamldecode(file("${path.module}/../models/data_intersight_vnic_iscsi_boot_policy.yml"))["data_intersight_vnic_iscsi_boot_policy"] }

data "intersight_vnic_iscsi_boot_policy" "n1474" {
  account_moid = try(local.m1474["account_moid"], null)
  additional_properties = try(local.m1474["additional_properties"], null)
  auto_targetvendor_name = try(local.m1474["auto_targetvendor_name"], null)
  class_id = try(local.m1474["class_id"], null)
  create_time = try(local.m1474["create_time"], null)
  description = try(local.m1474["description"], null)
  domain_group_moid = try(local.m1474["domain_group_moid"], null)
  id = try(local.m1474["id"], null)
  initiator_ip_source = try(local.m1474["initiator_ip_source"], null)
  initiator_static_ip_v4_address = try(local.m1474["initiator_static_ip_v4_address"], null)
  initiator_static_ip_v6_address = try(local.m1474["initiator_static_ip_v6_address"], null)
  iscsi_ip_type = try(local.m1474["iscsi_ip_type"], null)
  mod_time = try(local.m1474["mod_time"], null)
  moid = try(local.m1474["moid"], null)
  name = try(local.m1474["name"], null)
  object_type = try(local.m1474["object_type"], null)
  owners = try(local.m1474["owners"], null)
  results = try(local.m1474["results"], null)
  shared_scope = try(local.m1474["shared_scope"], null)
  target_source_type = try(local.m1474["target_source_type"], null)
  dynamic "ancestors" {
    for_each = try(local.m1474["ancestors"], null) == null ? [] : local.m1474["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "chap" {
    for_each = try(local.m1474["chap"], null) == null ? [] : local.m1474["chap"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "initiator_ip_pool" {
    for_each = try(local.m1474["initiator_ip_pool"], null) == null ? [] : local.m1474["initiator_ip_pool"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "initiator_static_ip_v4_config" {
    for_each = try(local.m1474["initiator_static_ip_v4_config"], null) == null ? [] : local.m1474["initiator_static_ip_v4_config"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "initiator_static_ip_v6_config" {
    for_each = try(local.m1474["initiator_static_ip_v6_config"], null) == null ? [] : local.m1474["initiator_static_ip_v6_config"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "iscsi_adapter_policy" {
    for_each = try(local.m1474["iscsi_adapter_policy"], null) == null ? [] : local.m1474["iscsi_adapter_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "mutual_chap" {
    for_each = try(local.m1474["mutual_chap"], null) == null ? [] : local.m1474["mutual_chap"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1474["organization"], null) == null ? [] : local.m1474["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1474["parent"], null) == null ? [] : local.m1474["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1474["permission_resources"], null) == null ? [] : local.m1474["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "primary_target_policy" {
    for_each = try(local.m1474["primary_target_policy"], null) == null ? [] : local.m1474["primary_target_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "secondary_target_policy" {
    for_each = try(local.m1474["secondary_target_policy"], null) == null ? [] : local.m1474["secondary_target_policy"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1474["tags"], null) == null ? [] : local.m1474["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1474["version_context"], null) == null ? [] : local.m1474["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
