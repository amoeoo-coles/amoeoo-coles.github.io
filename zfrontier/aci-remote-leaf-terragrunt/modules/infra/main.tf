# Planning / infra objects. Values are examples; confirm pools do not overlap.
resource "aci_rest_managed" "pod_setup" {
  dn         = "uni/controller/setuppol/setupp-${var.pod_id}"
  class_name = "fabricSetupP"
  content = {
    podId   = var.pod_id
    tepPool = var.tep_pool
  }
}
