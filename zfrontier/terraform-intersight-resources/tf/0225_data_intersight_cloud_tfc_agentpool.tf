# Sample data source intersight_cloud_tfc_agentpool — reads ../models/data_intersight_cloud_tfc_agentpool.yml
locals { m225 = yamldecode(file("${path.module}/../models/data_intersight_cloud_tfc_agentpool.yml"))["data_intersight_cloud_tfc_agentpool"] }

data "intersight_cloud_tfc_agentpool" "n225" {
  account_moid = try(local.m225["account_moid"], null)
  additional_properties = try(local.m225["additional_properties"], null)
  class_id = try(local.m225["class_id"], null)
  create_time = try(local.m225["create_time"], null)
  domain_group_moid = try(local.m225["domain_group_moid"], null)
  id = try(local.m225["id"], null)
  identity = try(local.m225["identity"], null)
  mod_time = try(local.m225["mod_time"], null)
  moid = try(local.m225["moid"], null)
  name = try(local.m225["name"], null)
  num_active_agents = try(local.m225["num_active_agents"], null)
  num_tokens = try(var.secrets["data_intersight_cloud_tfc_agentpool.num_tokens"], local.m225["num_tokens"])
  object_type = try(local.m225["object_type"], null)
  owners = try(local.m225["owners"], null)
  results = try(local.m225["results"], null)
  shared_scope = try(local.m225["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m225["ancestors"], null) == null ? [] : local.m225["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m225["organization"], null) == null ? [] : local.m225["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m225["parent"], null) == null ? [] : local.m225["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m225["permission_resources"], null) == null ? [] : local.m225["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m225["tags"], null) == null ? [] : local.m225["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m225["version_context"], null) == null ? [] : local.m225["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
