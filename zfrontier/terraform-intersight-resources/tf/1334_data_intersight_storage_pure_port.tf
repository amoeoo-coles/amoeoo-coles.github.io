# Sample data source intersight_storage_pure_port — reads ../models/data_intersight_storage_pure_port.yml
locals { m1334 = yamldecode(file("${path.module}/../models/data_intersight_storage_pure_port.yml"))["data_intersight_storage_pure_port"] }

data "intersight_storage_pure_port" "n1334" {
  account_moid = try(local.m1334["account_moid"], null)
  additional_properties = try(local.m1334["additional_properties"], null)
  class_id = try(local.m1334["class_id"], null)
  create_time = try(local.m1334["create_time"], null)
  domain_group_moid = try(local.m1334["domain_group_moid"], null)
  failover = try(local.m1334["failover"], null)
  id = try(local.m1334["id"], null)
  iqn = try(local.m1334["iqn"], null)
  mod_time = try(local.m1334["mod_time"], null)
  moid = try(local.m1334["moid"], null)
  name = try(local.m1334["name"], null)
  nqn = try(local.m1334["nqn"], null)
  object_type = try(local.m1334["object_type"], null)
  owners = try(local.m1334["owners"], null)
  portal = try(local.m1334["portal"], null)
  results = try(local.m1334["results"], null)
  shared_scope = try(local.m1334["shared_scope"], null)
  speed = try(local.m1334["speed"], null)
  status = try(local.m1334["status"], null)
  type = try(local.m1334["type"], null)
  wwn = try(local.m1334["wwn"], null)
  wwnn = try(local.m1334["wwnn"], null)
  wwpn = try(local.m1334["wwpn"], null)
  dynamic "ancestors" {
    for_each = try(local.m1334["ancestors"], null) == null ? [] : local.m1334["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "array" {
    for_each = try(local.m1334["array"], null) == null ? [] : local.m1334["array"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "controller" {
    for_each = try(local.m1334["controller"], null) == null ? [] : local.m1334["controller"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1334["parent"], null) == null ? [] : local.m1334["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1334["permission_resources"], null) == null ? [] : local.m1334["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1334["registered_device"], null) == null ? [] : local.m1334["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1334["tags"], null) == null ? [] : local.m1334["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1334["version_context"], null) == null ? [] : local.m1334["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
