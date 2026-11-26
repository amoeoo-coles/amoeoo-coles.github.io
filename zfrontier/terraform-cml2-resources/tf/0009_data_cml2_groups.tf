# Sample data source cml2_groups — reads ../models/data_cml2_groups.yml
locals { m009 = yamldecode(file("${path.module}/../models/data_cml2_groups.yml"))["data_cml2_groups"] }

data "cml2_groups" "n009" {
  groups = try(local.m009["groups"], null)
  id = try(local.m009["id"], null)
  name = try(local.m009["name"], null)
}
