# Sample data source cml2_system — reads ../models/data_cml2_system.yml
locals { m013 = yamldecode(file("${path.module}/../models/data_cml2_system.yml"))["data_cml2_system"] }

data "cml2_system" "n013" {
  id = try(local.m013["id"], null)
  ignore_errors = try(local.m013["ignore_errors"], null)
  ready = try(local.m013["ready"], null)
  timeout = try(local.m013["timeout"], null)
  version = try(local.m013["version"], null)
}
