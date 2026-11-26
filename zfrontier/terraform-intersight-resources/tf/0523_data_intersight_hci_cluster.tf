# Sample data source intersight_hci_cluster — reads ../models/data_intersight_hci_cluster.yml
locals { m523 = yamldecode(file("${path.module}/../models/data_intersight_hci_cluster.yml"))["data_intersight_hci_cluster"] }

data "intersight_hci_cluster" "n523" {
  account_moid = try(local.m523["account_moid"], null)
  additional_properties = try(local.m523["additional_properties"], null)
  build_info_build_type = try(local.m523["build_info_build_type"], null)
  build_info_commit_id = try(local.m523["build_info_commit_id"], null)
  build_info_full_version = try(local.m523["build_info_full_version"], null)
  build_info_short_commit_id = try(local.m523["build_info_short_commit_id"], null)
  build_info_version = try(local.m523["build_info_version"], null)
  class_id = try(local.m523["class_id"], null)
  cluster_arch = try(local.m523["cluster_arch"], null)
  cluster_ext_id = try(local.m523["cluster_ext_id"], null)
  cluster_function = try(local.m523["cluster_function"], null)
  cluster_type = try(local.m523["cluster_type"], null)
  container_name = try(local.m523["container_name"], null)
  cpu_capacity_hz = try(local.m523["cpu_capacity_hz"], null)
  cpu_usage_hz = try(local.m523["cpu_usage_hz"], null)
  create_time = try(local.m523["create_time"], null)
  domain_group_moid = try(local.m523["domain_group_moid"], null)
  encryption_in_transit_status = try(local.m523["encryption_in_transit_status"], null)
  encryption_scope = try(local.m523["encryption_scope"], null)
  external_subnet = try(local.m523["external_subnet"], null)
  hypervisor_types = try(local.m523["hypervisor_types"], null)
  id = try(local.m523["id"], null)
  incarnationid = try(local.m523["incarnationid"], null)
  inefficient_vm_count = try(local.m523["inefficient_vm_count"], null)
  internal_subnet = try(local.m523["internal_subnet"], null)
  is_lts = try(local.m523["is_lts"], null)
  key_management_server_type = try(local.m523["key_management_server_type"], null)
  masquerading_port = try(local.m523["masquerading_port"], null)
  memory_capacity_bytes = try(local.m523["memory_capacity_bytes"], null)
  memory_usage_bytes = try(local.m523["memory_usage_bytes"], null)
  mod_time = try(local.m523["mod_time"], null)
  moid = try(local.m523["moid"], null)
  name = try(local.m523["name"], null)
  number_of_nodes = try(local.m523["number_of_nodes"], null)
  object_type = try(local.m523["object_type"], null)
  operation_mode = try(local.m523["operation_mode"], null)
  owners = try(local.m523["owners"], null)
  password_remote_login_enabled = try(local.m523["password_remote_login_enabled"], null)
  pc_ext_id = try(local.m523["pc_ext_id"], null)
  redundancy_factor = try(local.m523["redundancy_factor"], null)
  remote_support = try(local.m523["remote_support"], null)
  results = try(local.m523["results"], null)
  shared_scope = try(local.m523["shared_scope"], null)
  storage_capacity_bytes = try(local.m523["storage_capacity_bytes"], null)
  storage_usage_bytes = try(local.m523["storage_usage_bytes"], null)
  timezone = try(local.m523["timezone"], null)
  upgrade_status = try(local.m523["upgrade_status"], null)
  vm_count = try(local.m523["vm_count"], null)
  dynamic "alarm_summary" {
    for_each = try(local.m523["alarm_summary"], null) == null ? [] : local.m523["alarm_summary"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m523["ancestors"], null) == null ? [] : local.m523["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "backplane" {
    for_each = try(local.m523["backplane"], null) == null ? [] : local.m523["backplane"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster_operation" {
    for_each = try(local.m523["cluster_operation"], null) == null ? [] : local.m523["cluster_operation"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster_software_map" {
    for_each = try(local.m523["cluster_software_map"], null) == null ? [] : local.m523["cluster_software_map"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compliance" {
    for_each = try(local.m523["compliance"], null) == null ? [] : local.m523["compliance"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "domain_manager" {
    for_each = try(local.m523["domain_manager"], null) == null ? [] : local.m523["domain_manager"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "entitlement" {
    for_each = try(local.m523["entitlement"], null) == null ? [] : local.m523["entitlement"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "external_address" {
    for_each = try(local.m523["external_address"], null) == null ? [] : local.m523["external_address"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "external_data_service_ip" {
    for_each = try(local.m523["external_data_service_ip"], null) == null ? [] : local.m523["external_data_service_ip"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fault_tolerance_state" {
    for_each = try(local.m523["fault_tolerance_state"], null) == null ? [] : local.m523["fault_tolerance_state"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "management_server" {
    for_each = try(local.m523["management_server"], null) == null ? [] : local.m523["management_server"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "masquerading_ip" {
    for_each = try(local.m523["masquerading_ip"], null) == null ? [] : local.m523["masquerading_ip"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "name_server_ip_list" {
    for_each = try(local.m523["name_server_ip_list"], null) == null ? [] : local.m523["name_server_ip_list"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nodes" {
    for_each = try(local.m523["nodes"], null) == null ? [] : local.m523["nodes"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ntp_server_ip_list" {
    for_each = try(local.m523["ntp_server_ip_list"], null) == null ? [] : local.m523["ntp_server_ip_list"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m523["parent"], null) == null ? [] : local.m523["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m523["permission_resources"], null) == null ? [] : local.m523["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "physical_gpus" {
    for_each = try(local.m523["physical_gpus"], null) == null ? [] : local.m523["physical_gpus"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "pulse_status" {
    for_each = try(local.m523["pulse_status"], null) == null ? [] : local.m523["pulse_status"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m523["registered_device"], null) == null ? [] : local.m523["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_containers" {
    for_each = try(local.m523["storage_containers"], null) == null ? [] : local.m523["storage_containers"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m523["tags"], null) == null ? [] : local.m523["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m523["version_context"], null) == null ? [] : local.m523["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "violation" {
    for_each = try(local.m523["violation"], null) == null ? [] : local.m523["violation"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "virtual_gpus" {
    for_each = try(local.m523["virtual_gpus"], null) == null ? [] : local.m523["virtual_gpus"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vms" {
    for_each = try(local.m523["vms"], null) == null ? [] : local.m523["vms"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
