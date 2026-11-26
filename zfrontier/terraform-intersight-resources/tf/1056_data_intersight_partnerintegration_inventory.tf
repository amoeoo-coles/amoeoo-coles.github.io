# Sample data source intersight_partnerintegration_inventory — reads ../models/data_intersight_partnerintegration_inventory.yml
locals { m1056 = yamldecode(file("${path.module}/../models/data_intersight_partnerintegration_inventory.yml"))["data_intersight_partnerintegration_inventory"] }

data "intersight_partnerintegration_inventory" "n1056" {
  account_moid = try(local.m1056["account_moid"], null)
  action = try(local.m1056["action"], null)
  additional_properties = try(local.m1056["additional_properties"], null)
  build_flags = try(local.m1056["build_flags"], null)
  build_start_time = try(local.m1056["build_start_time"], null)
  build_status = try(local.m1056["build_status"], null)
  class_id = try(local.m1056["class_id"], null)
  create_time = try(local.m1056["create_time"], null)
  deploy_start_time = try(local.m1056["deploy_start_time"], null)
  deploy_status = try(local.m1056["deploy_status"], null)
  domain_group_moid = try(local.m1056["domain_group_moid"], null)
  id = try(local.m1056["id"], null)
  image_name = try(local.m1056["image_name"], null)
  mod_time = try(local.m1056["mod_time"], null)
  moid = try(local.m1056["moid"], null)
  name = try(local.m1056["name"], null)
  object_type = try(local.m1056["object_type"], null)
  owners = try(local.m1056["owners"], null)
  python_sdk_url = try(local.m1056["python_sdk_url"], null)
  results = try(local.m1056["results"], null)
  shared_scope = try(local.m1056["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1056["ancestors"], null) == null ? [] : local.m1056["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "doc_issues" {
    for_each = try(local.m1056["doc_issues"], null) == null ? [] : local.m1056["doc_issues"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "etls" {
    for_each = try(local.m1056["etls"], null) == null ? [] : local.m1056["etls"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "logs" {
    for_each = try(local.m1056["logs"], null) == null ? [] : local.m1056["logs"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "metrics" {
    for_each = try(local.m1056["metrics"], null) == null ? [] : local.m1056["metrics"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "models" {
    for_each = try(local.m1056["models"], null) == null ? [] : local.m1056["models"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1056["organization"], null) == null ? [] : local.m1056["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1056["parent"], null) == null ? [] : local.m1056["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1056["permission_resources"], null) == null ? [] : local.m1056["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1056["tags"], null) == null ? [] : local.m1056["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1056["version_context"], null) == null ? [] : local.m1056["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
