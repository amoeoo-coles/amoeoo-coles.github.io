# Sample data source intersight_firmware_chassis_upgrade — reads ../models/data_intersight_firmware_chassis_upgrade.yml
locals { m480 = yamldecode(file("${path.module}/../models/data_intersight_firmware_chassis_upgrade.yml"))["data_intersight_firmware_chassis_upgrade"] }

data "intersight_firmware_chassis_upgrade" "n480" {
  account_moid = try(local.m480["account_moid"], null)
  additional_properties = try(local.m480["additional_properties"], null)
  chassis_name = try(local.m480["chassis_name"], null)
  class_id = try(local.m480["class_id"], null)
  create_time = try(local.m480["create_time"], null)
  domain_group_moid = try(local.m480["domain_group_moid"], null)
  exclude_component_list = try(local.m480["exclude_component_list"], null)
  id = try(local.m480["id"], null)
  mod_time = try(local.m480["mod_time"], null)
  moid = try(local.m480["moid"], null)
  object_type = try(local.m480["object_type"], null)
  owners = try(local.m480["owners"], null)
  results = try(local.m480["results"], null)
  shared_scope = try(local.m480["shared_scope"], null)
  skip_estimate_impact = try(local.m480["skip_estimate_impact"], null)
  status = try(local.m480["status"], null)
  upgrade_type = try(local.m480["upgrade_type"], null)
  xfm_upgrade_option = try(local.m480["xfm_upgrade_option"], null)
  dynamic "ancestors" {
    for_each = try(local.m480["ancestors"], null) == null ? [] : local.m480["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "chassis" {
    for_each = try(local.m480["chassis"], null) == null ? [] : local.m480["chassis"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device" {
    for_each = try(local.m480["device"], null) == null ? [] : local.m480["device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "direct_download" {
    for_each = try(local.m480["direct_download"], null) == null ? [] : local.m480["direct_download"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "distributable" {
    for_each = try(local.m480["distributable"], null) == null ? [] : local.m480["distributable"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "file_server" {
    for_each = try(local.m480["file_server"], null) == null ? [] : local.m480["file_server"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_share" {
    for_each = try(local.m480["network_share"], null) == null ? [] : local.m480["network_share"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m480["parent"], null) == null ? [] : local.m480["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m480["permission_resources"], null) == null ? [] : local.m480["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "release" {
    for_each = try(local.m480["release"], null) == null ? [] : local.m480["release"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m480["tags"], null) == null ? [] : local.m480["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "upgrade_impact" {
    for_each = try(local.m480["upgrade_impact"], null) == null ? [] : local.m480["upgrade_impact"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "upgrade_status" {
    for_each = try(local.m480["upgrade_status"], null) == null ? [] : local.m480["upgrade_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m480["version_context"], null) == null ? [] : local.m480["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
