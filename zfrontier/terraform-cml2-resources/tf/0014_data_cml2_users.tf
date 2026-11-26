# Sample data source cml2_users — reads ../models/data_cml2_users.yml
locals { m014 = yamldecode(file("${path.module}/../models/data_cml2_users.yml"))["data_cml2_users"] }

data "cml2_users" "n014" {
  id = try(local.m014["id"], null)
  username = try(local.m014["username"], null)
  users = try(local.m014["users"], null)
}
