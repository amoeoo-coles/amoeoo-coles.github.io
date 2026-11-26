# Sample data source intersight_firmware_pci_node_upgrade — reads ../models/data_intersight_firmware_pci_node_upgrade.yml
locals { m494 = yamldecode(file("${path.module}/../models/data_intersight_firmware_pci_node_upgrade.yml"))["data_intersight_firmware_pci_node_upgrade"] }

data "intersight_firmware_pci_node_upgrade" "n494" {
  account_moid = try(local.m494["account_moid"], null)
  additional_properties = try(local.m494["additional_properties"], null)
  class_id = try(local.m494["class_id"], null)
  create_time = try(local.m494["create_time"], null)
  domain_group_moid = try(local.m494["domain_group_moid"], null)
  id = try(local.m494["id"], null)
  mod_time = try(local.m494["mod_time"], null)
  moid = try(local.m494["moid"], null)
  object_type = try(local.m494["object_type"], null)
  owners = try(local.m494["owners"], null)
  results = try(local.m494["results"], null)
  shared_scope = try(local.m494["shared_scope"], null)
  skip_estimate_impact = try(local.m494["skip_estimate_impact"], null)
  status = try(local.m494["status"], null)
  upgrade_type = try(local.m494["upgrade_type"], null)
  dynamic "ancestors" {
    for_each = try(local.m494["ancestors"], null) == null ? [] : local.m494["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device" {
    for_each = try(local.m494["device"], null) == null ? [] : local.m494["device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "direct_download" {
    for_each = try(local.m494["direct_download"], null) == null ? [] : local.m494["direct_download"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "distributable" {
    for_each = try(local.m494["distributable"], null) == null ? [] : local.m494["distributable"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "file_server" {
    for_each = try(local.m494["file_server"], null) == null ? [] : local.m494["file_server"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_share" {
    for_each = try(local.m494["network_share"], null) == null ? [] : local.m494["network_share"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m494["parent"], null) == null ? [] : local.m494["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pci_node" {
    for_each = try(local.m494["pci_node"], null) == null ? [] : local.m494["pci_node"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m494["permission_resources"], null) == null ? [] : local.m494["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "release" {
    for_each = try(local.m494["release"], null) == null ? [] : local.m494["release"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m494["tags"], null) == null ? [] : local.m494["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "upgrade_impact" {
    for_each = try(local.m494["upgrade_impact"], null) == null ? [] : local.m494["upgrade_impact"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "upgrade_status" {
    for_each = try(local.m494["upgrade_status"], null) == null ? [] : local.m494["upgrade_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m494["version_context"], null) == null ? [] : local.m494["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
