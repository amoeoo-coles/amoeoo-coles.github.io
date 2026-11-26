# Sample resource cml2_lifecycle — reads ../models/cml2_lifecycle.yml
locals { m004 = yamldecode(file("${path.module}/../models/cml2_lifecycle.yml"))["cml2_lifecycle"] }

resource "cml2_lifecycle" "n004" {
  booted = try(local.m004["booted"], null)
  configs = try(local.m004["configs"], null)
  elements = try(local.m004["elements"], null)
  id = try(local.m004["id"], null)
  lab_id = try(local.m004["lab_id"], null)
  named_configs = try(local.m004["named_configs"], null)
  nodes = try(local.m004["nodes"], null)
  staging = try(local.m004["staging"], null)
  state = try(local.m004["state"], null)
  timeouts = try(local.m004["timeouts"], null)
  topology = try(local.m004["topology"], null)
  update_triggers = try(local.m004["update_triggers"], null)
  wait = try(local.m004["wait"], null)
}
