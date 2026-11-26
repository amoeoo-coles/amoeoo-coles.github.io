# Sample resource cml2_group — reads ../models/cml2_group.yml
locals { m002 = yamldecode(file("${path.module}/../models/cml2_group.yml"))["cml2_group"] }

resource "cml2_group" "n002" {
  description = try(local.m002["description"], null)
  id = try(local.m002["id"], null)
  labs = try(local.m002["labs"], null)
  members = try(local.m002["members"], null)
  name = try(local.m002["name"], null)
}
