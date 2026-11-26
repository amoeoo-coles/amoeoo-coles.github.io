# Sample data source intersight_oprs_deployment — reads ../models/data_intersight_oprs_deployment.yml
locals { m1028 = yamldecode(file("${path.module}/../models/data_intersight_oprs_deployment.yml"))["data_intersight_oprs_deployment"] }

data "intersight_oprs_deployment" "n1028" {
  account_moid = try(local.m1028["account_moid"], null)
  additional_properties = try(local.m1028["additional_properties"], null)
  available_replicas = try(local.m1028["available_replicas"], null)
  class_id = try(local.m1028["class_id"], null)
  create_time = try(local.m1028["create_time"], null)
  desired_replicas = try(local.m1028["desired_replicas"], null)
  domain_group_moid = try(local.m1028["domain_group_moid"], null)
  event = try(local.m1028["event"], null)
  id = try(local.m1028["id"], null)
  mod_time = try(local.m1028["mod_time"], null)
  moid = try(local.m1028["moid"], null)
  name = try(local.m1028["name"], null)
  namespace = try(local.m1028["namespace"], null)
  object_type = try(local.m1028["object_type"], null)
  owners = try(local.m1028["owners"], null)
  results = try(local.m1028["results"], null)
  shared_scope = try(local.m1028["shared_scope"], null)
  status = try(local.m1028["status"], null)
  time_stamp = try(local.m1028["time_stamp"], null)
  unavailable_replicas = try(local.m1028["unavailable_replicas"], null)
  dynamic "ancestors" {
    for_each = try(local.m1028["ancestors"], null) == null ? [] : local.m1028["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "assist" {
    for_each = try(local.m1028["assist"], null) == null ? [] : local.m1028["assist"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "labels" {
    for_each = try(local.m1028["labels"], null) == null ? [] : local.m1028["labels"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1028["parent"], null) == null ? [] : local.m1028["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1028["permission_resources"], null) == null ? [] : local.m1028["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1028["tags"], null) == null ? [] : local.m1028["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1028["version_context"], null) == null ? [] : local.m1028["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
