# Sample data source intersight_asset_deployment — reads ../models/data_intersight_asset_deployment.yml
locals { m091 = yamldecode(file("${path.module}/../models/data_intersight_asset_deployment.yml"))["data_intersight_asset_deployment"] }

data "intersight_asset_deployment" "n091" {
  account_moid = try(local.m091["account_moid"], null)
  additional_properties = try(local.m091["additional_properties"], null)
  class_id = try(local.m091["class_id"], null)
  create_time = try(local.m091["create_time"], null)
  deployment_ref_id = try(local.m091["deployment_ref_id"], null)
  domain_group_moid = try(local.m091["domain_group_moid"], null)
  end_date = try(local.m091["end_date"], null)
  id = try(local.m091["id"], null)
  license_type = try(local.m091["license_type"], null)
  mlb_offer_type = try(local.m091["mlb_offer_type"], null)
  mod_time = try(local.m091["mod_time"], null)
  moid = try(local.m091["moid"], null)
  object_type = try(local.m091["object_type"], null)
  owners = try(local.m091["owners"], null)
  results = try(local.m091["results"], null)
  shared_scope = try(local.m091["shared_scope"], null)
  start_date = try(local.m091["start_date"], null)
  subscription_ref_id = try(local.m091["subscription_ref_id"], null)
  workloads = try(local.m091["workloads"], null)
  dynamic "alarm_info" {
    for_each = try(local.m091["alarm_info"], null) == null ? [] : local.m091["alarm_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m091["ancestors"], null) == null ? [] : local.m091["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "devices" {
    for_each = try(local.m091["devices"], null) == null ? [] : local.m091["devices"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "end_customer" {
    for_each = try(local.m091["end_customer"], null) == null ? [] : local.m091["end_customer"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m091["parent"], null) == null ? [] : local.m091["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m091["permission_resources"], null) == null ? [] : local.m091["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "subscription" {
    for_each = try(local.m091["subscription"], null) == null ? [] : local.m091["subscription"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m091["tags"], null) == null ? [] : local.m091["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "unit_of_measure" {
    for_each = try(local.m091["unit_of_measure"], null) == null ? [] : local.m091["unit_of_measure"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m091["version_context"], null) == null ? [] : local.m091["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
