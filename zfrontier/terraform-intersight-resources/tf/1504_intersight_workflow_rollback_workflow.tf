# Sample resource intersight_workflow_rollback_workflow — reads ../models/intersight_workflow_rollback_workflow.yml
locals { m1504 = yamldecode(file("${path.module}/../models/intersight_workflow_rollback_workflow.yml"))["intersight_workflow_rollback_workflow"] }

resource "intersight_workflow_rollback_workflow" "n1504" {
  account_moid = try(local.m1504["account_moid"], null)
  action = try(local.m1504["action"], null)
  additional_properties = try(local.m1504["additional_properties"], null)
  ancestors = try(local.m1504["ancestors"], null)
  class_id = try(local.m1504["class_id"], null)
  continue_on_task_failure = try(local.m1504["continue_on_task_failure"], null)
  create_time = try(local.m1504["create_time"], null)
  domain_group_moid = try(local.m1504["domain_group_moid"], null)
  id = try(local.m1504["id"], null)
  mod_time = try(local.m1504["mod_time"], null)
  moid = try(local.m1504["moid"], null)
  object_type = try(local.m1504["object_type"], null)
  owners = try(local.m1504["owners"], null)
  parent = try(local.m1504["parent"], null)
  permission_resources = try(local.m1504["permission_resources"], null)
  primary_workflow = try(local.m1504["primary_workflow"], null)
  rollback_tasks = try(local.m1504["rollback_tasks"], null)
  rollback_workflows = try(local.m1504["rollback_workflows"], null)
  selected_tasks = try(local.m1504["selected_tasks"], null)
  shared_scope = try(local.m1504["shared_scope"], null)
  status = try(local.m1504["status"], null)
  tags = try(local.m1504["tags"], null)
  version_context = try(local.m1504["version_context"], null)
  wait_for_completion = try(local.m1504["wait_for_completion"], null)
}
