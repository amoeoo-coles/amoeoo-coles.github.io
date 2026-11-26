# Sample data source intersight_os_distribution — reads ../models/data_intersight_os_distribution.yml
locals { m1041 = yamldecode(file("${path.module}/../models/data_intersight_os_distribution.yml"))["data_intersight_os_distribution"] }

data "intersight_os_distribution" "n1041" {
  account_moid = try(local.m1041["account_moid"], null)
  additional_properties = try(local.m1041["additional_properties"], null)
  class_id = try(local.m1041["class_id"], null)
  create_time = try(local.m1041["create_time"], null)
  domain_group_moid = try(local.m1041["domain_group_moid"], null)
  id = try(local.m1041["id"], null)
  is_supported = try(local.m1041["is_supported"], null)
  label = try(local.m1041["label"], null)
  mod_time = try(local.m1041["mod_time"], null)
  moid = try(local.m1041["moid"], null)
  name = try(local.m1041["name"], null)
  object_type = try(local.m1041["object_type"], null)
  owners = try(local.m1041["owners"], null)
  results = try(local.m1041["results"], null)
  scu_supported = try(local.m1041["scu_supported"], null)
  shared_scope = try(local.m1041["shared_scope"], null)
  supported_editions = try(local.m1041["supported_editions"], null)
  dynamic "ancestors" {
    for_each = try(local.m1041["ancestors"], null) == null ? [] : local.m1041["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "catalog" {
    for_each = try(local.m1041["catalog"], null) == null ? [] : local.m1041["catalog"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nr_version" {
    for_each = try(local.m1041["nr_version"], null) == null ? [] : local.m1041["nr_version"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1041["parent"], null) == null ? [] : local.m1041["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1041["permission_resources"], null) == null ? [] : local.m1041["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1041["tags"], null) == null ? [] : local.m1041["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vendor" {
    for_each = try(local.m1041["vendor"], null) == null ? [] : local.m1041["vendor"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1041["version_context"], null) == null ? [] : local.m1041["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
