# Sample data source intersight_appliance_setup_info — reads ../models/data_intersight_appliance_setup_info.yml
locals { m076 = yamldecode(file("${path.module}/../models/data_intersight_appliance_setup_info.yml"))["data_intersight_appliance_setup_info"] }

data "intersight_appliance_setup_info" "n076" {
  account_moid = try(local.m076["account_moid"], null)
  additional_properties = try(local.m076["additional_properties"], null)
  build_type = try(local.m076["build_type"], null)
  class_id = try(local.m076["class_id"], null)
  cloud_url = try(local.m076["cloud_url"], null)
  create_time = try(local.m076["create_time"], null)
  deployment_mode = try(local.m076["deployment_mode"], null)
  domain_group_moid = try(local.m076["domain_group_moid"], null)
  end_time = try(local.m076["end_time"], null)
  id = try(local.m076["id"], null)
  latest_version = try(local.m076["latest_version"], null)
  min_cpu = try(local.m076["min_cpu"], null)
  min_ram = try(local.m076["min_ram"], null)
  mod_time = try(local.m076["mod_time"], null)
  moid = try(local.m076["moid"], null)
  object_type = try(local.m076["object_type"], null)
  owners = try(local.m076["owners"], null)
  results = try(local.m076["results"], null)
  setup_states = try(local.m076["setup_states"], null)
  shared_scope = try(local.m076["shared_scope"], null)
  start_time = try(local.m076["start_time"], null)
  dynamic "account" {
    for_each = try(local.m076["account"], null) == null ? [] : local.m076["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m076["ancestors"], null) == null ? [] : local.m076["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "capabilities" {
    for_each = try(local.m076["capabilities"], null) == null ? [] : local.m076["capabilities"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m076["parent"], null) == null ? [] : local.m076["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m076["permission_resources"], null) == null ? [] : local.m076["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m076["tags"], null) == null ? [] : local.m076["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m076["version_context"], null) == null ? [] : local.m076["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
