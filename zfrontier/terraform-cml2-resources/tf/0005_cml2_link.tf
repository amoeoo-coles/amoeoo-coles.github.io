# Sample resource cml2_link — reads ../models/cml2_link.yml
locals { m005 = yamldecode(file("${path.module}/../models/cml2_link.yml"))["cml2_link"] }

resource "cml2_link" "n005" {
  id = try(local.m005["id"], null)
  interface_a = try(local.m005["interface_a"], null)
  interface_b = try(local.m005["interface_b"], null)
  lab_id = try(local.m005["lab_id"], null)
  label = try(local.m005["label"], null)
  link_capture_key = try(var.secrets["cml2_link.link_capture_key"], local.m005["link_capture_key"])
  node_a = try(local.m005["node_a"], null)
  node_b = try(local.m005["node_b"], null)
  slot_a = try(local.m005["slot_a"], null)
  slot_b = try(local.m005["slot_b"], null)
  state = try(local.m005["state"], null)
}
