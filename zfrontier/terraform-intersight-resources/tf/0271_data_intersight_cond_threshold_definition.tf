# Sample data source intersight_cond_threshold_definition — reads ../models/data_intersight_cond_threshold_definition.yml
locals { m271 = yamldecode(file("${path.module}/../models/data_intersight_cond_threshold_definition.yml"))["data_intersight_cond_threshold_definition"] }

data "intersight_cond_threshold_definition" "n271" {
  account_moid = try(local.m271["account_moid"], null)
  additional_properties = try(local.m271["additional_properties"], null)
  class_id = try(local.m271["class_id"], null)
  create_time = try(local.m271["create_time"], null)
  description = try(local.m271["description"], null)
  domain_group_moid = try(local.m271["domain_group_moid"], null)
  id = try(local.m271["id"], null)
  mod_time = try(local.m271["mod_time"], null)
  moid = try(local.m271["moid"], null)
  name = try(local.m271["name"], null)
  object_type = try(local.m271["object_type"], null)
  owners = try(local.m271["owners"], null)
  probable_cause = try(local.m271["probable_cause"], null)
  remediation = try(local.m271["remediation"], null)
  results = try(local.m271["results"], null)
  shared_scope = try(local.m271["shared_scope"], null)
  system_classifications = try(local.m271["system_classifications"], null)
  dynamic "account" {
    for_each = try(local.m271["account"], null) == null ? [] : local.m271["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m271["ancestors"], null) == null ? [] : local.m271["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "condition" {
    for_each = try(local.m271["condition"], null) == null ? [] : local.m271["condition"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m271["parent"], null) == null ? [] : local.m271["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m271["permission_resources"], null) == null ? [] : local.m271["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m271["tags"], null) == null ? [] : local.m271["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m271["version_context"], null) == null ? [] : local.m271["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
