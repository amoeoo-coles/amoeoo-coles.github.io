# Sample data source intersight_hyperflex_node — reads ../models/data_intersight_hyperflex_node.yml
locals { m619 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_node.yml"))["data_intersight_hyperflex_node"] }

data "intersight_hyperflex_node" "n619" {
  account_moid = try(local.m619["account_moid"], null)
  additional_properties = try(local.m619["additional_properties"], null)
  build_number = try(local.m619["build_number"], null)
  class_id = try(local.m619["class_id"], null)
  create_time = try(local.m619["create_time"], null)
  display_version = try(local.m619["display_version"], null)
  domain_group_moid = try(local.m619["domain_group_moid"], null)
  empty_slots_list = try(local.m619["empty_slots_list"], null)
  host_name = try(local.m619["host_name"], null)
  hypervisor = try(local.m619["hypervisor"], null)
  id = try(local.m619["id"], null)
  lockdown = try(local.m619["lockdown"], null)
  mod_time = try(local.m619["mod_time"], null)
  model_number = try(local.m619["model_number"], null)
  moid = try(local.m619["moid"], null)
  node_maintenance_mode = try(local.m619["node_maintenance_mode"], null)
  node_status = try(local.m619["node_status"], null)
  node_uuid = try(local.m619["node_uuid"], null)
  nr_version = try(local.m619["nr_version"], null)
  object_type = try(local.m619["object_type"], null)
  owners = try(local.m619["owners"], null)
  results = try(local.m619["results"], null)
  role = try(local.m619["role"], null)
  serial_number = try(local.m619["serial_number"], null)
  shared_scope = try(local.m619["shared_scope"], null)
  status = try(local.m619["status"], null)
  dynamic "ancestors" {
    for_each = try(local.m619["ancestors"], null) == null ? [] : local.m619["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster" {
    for_each = try(local.m619["cluster"], null) == null ? [] : local.m619["cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster_member" {
    for_each = try(local.m619["cluster_member"], null) == null ? [] : local.m619["cluster_member"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "drives" {
    for_each = try(local.m619["drives"], null) == null ? [] : local.m619["drives"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "hxdp_data_ip" {
    for_each = try(local.m619["hxdp_data_ip"], null) == null ? [] : local.m619["hxdp_data_ip"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "hxdp_mmgt_ip" {
    for_each = try(local.m619["hxdp_mmgt_ip"], null) == null ? [] : local.m619["hxdp_mmgt_ip"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "hypervisor_data_ip" {
    for_each = try(local.m619["hypervisor_data_ip"], null) == null ? [] : local.m619["hypervisor_data_ip"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "identity" {
    for_each = try(local.m619["identity"], null) == null ? [] : local.m619["identity"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ip" {
    for_each = try(local.m619["ip"], null) == null ? [] : local.m619["ip"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m619["parent"], null) == null ? [] : local.m619["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m619["permission_resources"], null) == null ? [] : local.m619["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "physical_server" {
    for_each = try(local.m619["physical_server"], null) == null ? [] : local.m619["physical_server"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "site_info" {
    for_each = try(local.m619["site_info"], null) == null ? [] : local.m619["site_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m619["tags"], null) == null ? [] : local.m619["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m619["version_context"], null) == null ? [] : local.m619["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
