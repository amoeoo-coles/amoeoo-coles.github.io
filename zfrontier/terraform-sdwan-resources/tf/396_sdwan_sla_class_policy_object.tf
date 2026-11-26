# 396 · resource sdwan_sla_class_policy_object · 10. (Classic) policy objects
# This resource can manage a SLA Class Policy Object .
# Reads models/sdwan_sla_class_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_396 = yamldecode(file("${path.module}/../models/sdwan_sla_class_policy_object.yml"))["sdwan_sla_class_policy_object"]
}

resource "sdwan_sla_class_policy_object" "n396" {
  app_probe_class_id = local.m_396["app_probe_class_id"]
  app_probe_class_version = local.m_396["app_probe_class_version"]
  fallback_best_tunnel_criteria = local.m_396["fallback_best_tunnel_criteria"]
  fallback_best_tunnel_jitter = local.m_396["fallback_best_tunnel_jitter"]
  fallback_best_tunnel_latency = local.m_396["fallback_best_tunnel_latency"]
  fallback_best_tunnel_loss = local.m_396["fallback_best_tunnel_loss"]
  jitter = local.m_396["jitter"]
  latency = local.m_396["latency"]
  loss = local.m_396["loss"]
  name = local.m_396["name"]
}
