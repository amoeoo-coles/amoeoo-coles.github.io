# Sample data source intersight_appliance_cluster_info — reads ../models/data_intersight_appliance_cluster_info.yml
locals { m041 = yamldecode(file("${path.module}/../models/data_intersight_appliance_cluster_info.yml"))["data_intersight_appliance_cluster_info"] }

data "intersight_appliance_cluster_info" "n041" {
  account_moid = try(local.m041["account_moid"], null)
  additional_properties = try(local.m041["additional_properties"], null)
  build_type = try(local.m041["build_type"], null)
  class_id = try(local.m041["class_id"], null)
  create_time = try(local.m041["create_time"], null)
  deployment_size = try(local.m041["deployment_size"], null)
  domain_group_moid = try(local.m041["domain_group_moid"], null)
  gateway = try(local.m041["gateway"], null)
  hostip = try(local.m041["hostip"], null)
  hostname = try(local.m041["hostname"], null)
  hypervisor_type = try(local.m041["hypervisor_type"], null)
  id = try(local.m041["id"], null)
  installer_version = try(local.m041["installer_version"], null)
  mod_time = try(local.m041["mod_time"], null)
  moid = try(local.m041["moid"], null)
  node_id = try(local.m041["node_id"], null)
  node_type = try(local.m041["node_type"], null)
  object_type = try(local.m041["object_type"], null)
  owners = try(local.m041["owners"], null)
  partition_database = try(local.m041["partition_database"], null)
  partition_file_cisco = try(local.m041["partition_file_cisco"], null)
  partition_opt_data = try(local.m041["partition_opt_data"], null)
  partition_opt_kafka = try(local.m041["partition_opt_kafka"], null)
  partition_opt_mongo = try(local.m041["partition_opt_mongo"], null)
  partition_var_lib_docker = try(local.m041["partition_var_lib_docker"], null)
  partition_var_log = try(local.m041["partition_var_log"], null)
  peerkey = try(local.m041["peerkey"], null)
  responsekey = try(local.m041["responsekey"], null)
  results = try(local.m041["results"], null)
  shared_scope = try(local.m041["shared_scope"], null)
  status = try(local.m041["status"], null)
  subnetmask = try(local.m041["subnetmask"], null)
  uuid = try(local.m041["uuid"], null)
  dynamic "account" {
    for_each = try(local.m041["account"], null) == null ? [] : local.m041["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m041["ancestors"], null) == null ? [] : local.m041["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m041["parent"], null) == null ? [] : local.m041["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m041["permission_resources"], null) == null ? [] : local.m041["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m041["tags"], null) == null ? [] : local.m041["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m041["version_context"], null) == null ? [] : local.m041["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
