# 011 · resource thousandeyes_tag_assignment · 3. Tags
# - `id` (String) Object Id. - `type` (String) [test, v-agent, endpoint-test, dashboard] Type of assignment.
# Reads models/thousandeyes_tag_assignment.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider thousandeyes/thousandeyes 3.3.0. Credentials come from variables only.

locals {
  m_011 = yamldecode(file("${path.module}/../models/thousandeyes_tag_assignment.yml"))["thousandeyes_tag_assignment"]
}

resource "thousandeyes_tag_assignment" "n011" {
  id     = local.m_011["id"]
  tag_id = local.m_011["tag_id"]
  dynamic "assignments" {
    iterator = assignments_1
    for_each = local.m_011["assignments"] == null ? [] : range(length(local.m_011["assignments"]))
    content {
      id   = lookup(local.m_011["assignments"][assignments_1.value], "id", null)
      type = lookup(local.m_011["assignments"][assignments_1.value], "type", null)
    }
  }
}
