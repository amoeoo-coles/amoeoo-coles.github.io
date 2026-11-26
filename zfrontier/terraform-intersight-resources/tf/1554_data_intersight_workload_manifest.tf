# Sample data source intersight_workload_manifest — reads ../models/data_intersight_workload_manifest.yml
locals { m1554 = yamldecode(file("${path.module}/../models/data_intersight_workload_manifest.yml"))["data_intersight_workload_manifest"] }

data "intersight_workload_manifest" "n1554" {
  account_moid = try(local.m1554["account_moid"], null)
  additional_properties = try(local.m1554["additional_properties"], null)
  class_id = try(local.m1554["class_id"], null)
  create_time = try(local.m1554["create_time"], null)
  domain_group_moid = try(local.m1554["domain_group_moid"], null)
  id = try(local.m1554["id"], null)
  import_status = try(local.m1554["import_status"], null)
  mod_time = try(local.m1554["mod_time"], null)
  moid = try(local.m1554["moid"], null)
  nr_version = try(local.m1554["nr_version"], null)
  object_type = try(local.m1554["object_type"], null)
  owners = try(local.m1554["owners"], null)
  results = try(local.m1554["results"], null)
  shared_scope = try(local.m1554["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1554["ancestors"], null) == null ? [] : local.m1554["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "catalog" {
    for_each = try(local.m1554["catalog"], null) == null ? [] : local.m1554["catalog"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "manifest_items" {
    for_each = try(local.m1554["manifest_items"], null) == null ? [] : local.m1554["manifest_items"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1554["parent"], null) == null ? [] : local.m1554["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1554["permission_resources"], null) == null ? [] : local.m1554["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1554["tags"], null) == null ? [] : local.m1554["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1554["version_context"], null) == null ? [] : local.m1554["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
