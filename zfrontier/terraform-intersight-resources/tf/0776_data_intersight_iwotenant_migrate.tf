# Sample data source intersight_iwotenant_migrate — reads ../models/data_intersight_iwotenant_migrate.yml
locals { m776 = yamldecode(file("${path.module}/../models/data_intersight_iwotenant_migrate.yml"))["data_intersight_iwotenant_migrate"] }

data "intersight_iwotenant_migrate" "n776" {
  account_moid = try(local.m776["account_moid"], null)
  additional_properties = try(local.m776["additional_properties"], null)
  class_id = try(local.m776["class_id"], null)
  create_time = try(local.m776["create_time"], null)
  domain_group_moid = try(local.m776["domain_group_moid"], null)
  id = try(local.m776["id"], null)
  is_password_set = try(var.secrets["data_intersight_iwotenant_migrate.is_password_set"], local.m776["is_password_set"])
  mod_time = try(local.m776["mod_time"], null)
  moid = try(local.m776["moid"], null)
  object_type = try(local.m776["object_type"], null)
  owners = try(local.m776["owners"], null)
  password = try(var.secrets["data_intersight_iwotenant_migrate.password"], local.m776["password"])
  results = try(local.m776["results"], null)
  shared_scope = try(local.m776["shared_scope"], null)
  url = try(local.m776["url"], null)
  dynamic "account" {
    for_each = try(local.m776["account"], null) == null ? [] : local.m776["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m776["ancestors"], null) == null ? [] : local.m776["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m776["parent"], null) == null ? [] : local.m776["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m776["permission_resources"], null) == null ? [] : local.m776["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m776["tags"], null) == null ? [] : local.m776["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m776["version_context"], null) == null ? [] : local.m776["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
