# Sample data source intersight_hyperflex_app_catalog — reads ../models/data_intersight_hyperflex_app_catalog.yml
locals { m578 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_app_catalog.yml"))["data_intersight_hyperflex_app_catalog"] }

data "intersight_hyperflex_app_catalog" "n578" {
  account_moid = try(local.m578["account_moid"], null)
  additional_properties = try(local.m578["additional_properties"], null)
  class_id = try(local.m578["class_id"], null)
  create_time = try(local.m578["create_time"], null)
  domain_group_moid = try(local.m578["domain_group_moid"], null)
  id = try(local.m578["id"], null)
  mod_time = try(local.m578["mod_time"], null)
  moid = try(local.m578["moid"], null)
  nr_version = try(local.m578["nr_version"], null)
  object_type = try(local.m578["object_type"], null)
  owners = try(local.m578["owners"], null)
  results = try(local.m578["results"], null)
  shared_scope = try(local.m578["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m578["ancestors"], null) == null ? [] : local.m578["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "feature_limit_external" {
    for_each = try(local.m578["feature_limit_external"], null) == null ? [] : local.m578["feature_limit_external"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "feature_limit_internal" {
    for_each = try(local.m578["feature_limit_internal"], null) == null ? [] : local.m578["feature_limit_internal"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "hxdp_versions" {
    for_each = try(local.m578["hxdp_versions"], null) == null ? [] : local.m578["hxdp_versions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "hyperflex_capability_infos" {
    for_each = try(local.m578["hyperflex_capability_infos"], null) == null ? [] : local.m578["hyperflex_capability_infos"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "hyperflex_software_compatibility_infos" {
    for_each = try(local.m578["hyperflex_software_compatibility_infos"], null) == null ? [] : local.m578["hyperflex_software_compatibility_infos"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m578["parent"], null) == null ? [] : local.m578["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m578["permission_resources"], null) == null ? [] : local.m578["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "server_firmware_version" {
    for_each = try(local.m578["server_firmware_version"], null) == null ? [] : local.m578["server_firmware_version"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "server_model" {
    for_each = try(local.m578["server_model"], null) == null ? [] : local.m578["server_model"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "software_distributions" {
    for_each = try(local.m578["software_distributions"], null) == null ? [] : local.m578["software_distributions"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m578["tags"], null) == null ? [] : local.m578["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m578["version_context"], null) == null ? [] : local.m578["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
