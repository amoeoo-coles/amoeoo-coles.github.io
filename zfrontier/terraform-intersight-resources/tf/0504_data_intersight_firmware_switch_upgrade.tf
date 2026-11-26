# Sample data source intersight_firmware_switch_upgrade — reads ../models/data_intersight_firmware_switch_upgrade.yml
locals { m504 = yamldecode(file("${path.module}/../models/data_intersight_firmware_switch_upgrade.yml"))["data_intersight_firmware_switch_upgrade"] }

data "intersight_firmware_switch_upgrade" "n504" {
  account_moid = try(local.m504["account_moid"], null)
  additional_properties = try(local.m504["additional_properties"], null)
  class_id = try(local.m504["class_id"], null)
  create_time = try(local.m504["create_time"], null)
  domain_group_moid = try(local.m504["domain_group_moid"], null)
  enable_fabric_evacuation = try(local.m504["enable_fabric_evacuation"], null)
  enable_pdb_fpga_upgrade = try(local.m504["enable_pdb_fpga_upgrade"], null)
  enable_psu_upgrade = try(local.m504["enable_psu_upgrade"], null)
  id = try(local.m504["id"], null)
  mod_time = try(local.m504["mod_time"], null)
  moid = try(local.m504["moid"], null)
  object_type = try(local.m504["object_type"], null)
  owners = try(local.m504["owners"], null)
  results = try(local.m504["results"], null)
  shared_scope = try(local.m504["shared_scope"], null)
  skip_estimate_impact = try(local.m504["skip_estimate_impact"], null)
  skip_wait_for_io_path_connectivity = try(local.m504["skip_wait_for_io_path_connectivity"], null)
  status = try(local.m504["status"], null)
  switch_name = try(local.m504["switch_name"], null)
  upgrade_type = try(local.m504["upgrade_type"], null)
  wait_time_out = try(local.m504["wait_time_out"], null)
  dynamic "ancestors" {
    for_each = try(local.m504["ancestors"], null) == null ? [] : local.m504["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device" {
    for_each = try(local.m504["device"], null) == null ? [] : local.m504["device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "direct_download" {
    for_each = try(local.m504["direct_download"], null) == null ? [] : local.m504["direct_download"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "distributable" {
    for_each = try(local.m504["distributable"], null) == null ? [] : local.m504["distributable"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "file_server" {
    for_each = try(local.m504["file_server"], null) == null ? [] : local.m504["file_server"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_elements" {
    for_each = try(local.m504["network_elements"], null) == null ? [] : local.m504["network_elements"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_share" {
    for_each = try(local.m504["network_share"], null) == null ? [] : local.m504["network_share"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m504["parent"], null) == null ? [] : local.m504["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m504["permission_resources"], null) == null ? [] : local.m504["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "release" {
    for_each = try(local.m504["release"], null) == null ? [] : local.m504["release"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m504["tags"], null) == null ? [] : local.m504["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "upgrade_impact" {
    for_each = try(local.m504["upgrade_impact"], null) == null ? [] : local.m504["upgrade_impact"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "upgrade_status" {
    for_each = try(local.m504["upgrade_status"], null) == null ? [] : local.m504["upgrade_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m504["version_context"], null) == null ? [] : local.m504["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
