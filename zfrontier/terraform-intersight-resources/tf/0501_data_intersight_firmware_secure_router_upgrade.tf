# Sample data source intersight_firmware_secure_router_upgrade — reads ../models/data_intersight_firmware_secure_router_upgrade.yml
locals { m501 = yamldecode(file("${path.module}/../models/data_intersight_firmware_secure_router_upgrade.yml"))["data_intersight_firmware_secure_router_upgrade"] }

data "intersight_firmware_secure_router_upgrade" "n501" {
  account_moid = try(local.m501["account_moid"], null)
  additional_properties = try(local.m501["additional_properties"], null)
  class_id = try(local.m501["class_id"], null)
  create_time = try(local.m501["create_time"], null)
  domain_group_moid = try(local.m501["domain_group_moid"], null)
  id = try(local.m501["id"], null)
  mod_time = try(local.m501["mod_time"], null)
  moid = try(local.m501["moid"], null)
  object_type = try(local.m501["object_type"], null)
  owners = try(local.m501["owners"], null)
  results = try(local.m501["results"], null)
  shared_scope = try(local.m501["shared_scope"], null)
  skip_estimate_impact = try(local.m501["skip_estimate_impact"], null)
  status = try(local.m501["status"], null)
  upgrade_type = try(local.m501["upgrade_type"], null)
  dynamic "ancestors" {
    for_each = try(local.m501["ancestors"], null) == null ? [] : local.m501["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device" {
    for_each = try(local.m501["device"], null) == null ? [] : local.m501["device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "direct_download" {
    for_each = try(local.m501["direct_download"], null) == null ? [] : local.m501["direct_download"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "distributable" {
    for_each = try(local.m501["distributable"], null) == null ? [] : local.m501["distributable"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "file_server" {
    for_each = try(local.m501["file_server"], null) == null ? [] : local.m501["file_server"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_secure_router" {
    for_each = try(local.m501["network_secure_router"], null) == null ? [] : local.m501["network_secure_router"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_share" {
    for_each = try(local.m501["network_share"], null) == null ? [] : local.m501["network_share"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m501["parent"], null) == null ? [] : local.m501["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m501["permission_resources"], null) == null ? [] : local.m501["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "release" {
    for_each = try(local.m501["release"], null) == null ? [] : local.m501["release"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m501["tags"], null) == null ? [] : local.m501["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "upgrade_impact" {
    for_each = try(local.m501["upgrade_impact"], null) == null ? [] : local.m501["upgrade_impact"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "upgrade_status" {
    for_each = try(local.m501["upgrade_status"], null) == null ? [] : local.m501["upgrade_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m501["version_context"], null) == null ? [] : local.m501["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
