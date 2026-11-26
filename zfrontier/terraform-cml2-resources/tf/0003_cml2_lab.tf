# Sample resource cml2_lab — reads ../models/cml2_lab.yml
locals { m003 = yamldecode(file("${path.module}/../models/cml2_lab.yml"))["cml2_lab"] }

resource "cml2_lab" "n003" {
  created = try(local.m003["created"], null)
  description = try(local.m003["description"], null)
  groups = try(local.m003["groups"], null)
  id = try(local.m003["id"], null)
  link_count = try(local.m003["link_count"], null)
  modified = try(local.m003["modified"], null)
  node_count = try(local.m003["node_count"], null)
  node_staging = try(local.m003["node_staging"], null)
  notes = try(local.m003["notes"], null)
  owner = try(local.m003["owner"], null)
  state = try(local.m003["state"], null)
  title = try(local.m003["title"], null)
}
