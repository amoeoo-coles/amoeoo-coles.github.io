# Sample data source intersight_license_license_info — reads ../models/data_intersight_license_license_info.yml
locals { m804 = yamldecode(file("${path.module}/../models/data_intersight_license_license_info.yml"))["data_intersight_license_license_info"] }

data "intersight_license_license_info" "n804" {
  account_moid = try(local.m804["account_moid"], null)
  active_admin = try(local.m804["active_admin"], null)
  additional_properties = try(local.m804["additional_properties"], null)
  balance = try(local.m804["balance"], null)
  class_id = try(local.m804["class_id"], null)
  create_time = try(local.m804["create_time"], null)
  days_left = try(local.m804["days_left"], null)
  domain_group_moid = try(local.m804["domain_group_moid"], null)
  end_time = try(local.m804["end_time"], null)
  enforce_mode = try(local.m804["enforce_mode"], null)
  error_desc = try(local.m804["error_desc"], null)
  evaluation_period = try(local.m804["evaluation_period"], null)
  expire_time = try(local.m804["expire_time"], null)
  extra_evaluation = try(local.m804["extra_evaluation"], null)
  id = try(local.m804["id"], null)
  last_trial_grace_eval_time = try(local.m804["last_trial_grace_eval_time"], null)
  license_count = try(local.m804["license_count"], null)
  license_count_purchased = try(local.m804["license_count_purchased"], null)
  license_state = try(local.m804["license_state"], null)
  license_type = try(local.m804["license_type"], null)
  mod_time = try(local.m804["mod_time"], null)
  moid = try(local.m804["moid"], null)
  net_substitution = try(local.m804["net_substitution"], null)
  object_type = try(local.m804["object_type"], null)
  owners = try(local.m804["owners"], null)
  results = try(local.m804["results"], null)
  shared_scope = try(local.m804["shared_scope"], null)
  start_time = try(local.m804["start_time"], null)
  subscription_id = try(local.m804["subscription_id"], null)
  trial_admin = try(local.m804["trial_admin"], null)
  dynamic "account_license_data" {
    for_each = try(local.m804["account_license_data"], null) == null ? [] : local.m804["account_license_data"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m804["ancestors"], null) == null ? [] : local.m804["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m804["parent"], null) == null ? [] : local.m804["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m804["permission_resources"], null) == null ? [] : local.m804["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "substituted_license" {
    for_each = try(local.m804["substituted_license"], null) == null ? [] : local.m804["substituted_license"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m804["tags"], null) == null ? [] : local.m804["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m804["version_context"], null) == null ? [] : local.m804["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
