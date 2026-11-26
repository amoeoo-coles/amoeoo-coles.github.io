# Sample resource cml2_user — reads ../models/cml2_user.yml
locals { m007 = yamldecode(file("${path.module}/../models/cml2_user.yml"))["cml2_user"] }

resource "cml2_user" "n007" {
  description = try(local.m007["description"], null)
  directory_dn = try(local.m007["directory_dn"], null)
  email = try(local.m007["email"], null)
  fullname = try(local.m007["fullname"], null)
  groups = try(local.m007["groups"], null)
  id = try(local.m007["id"], null)
  is_admin = try(local.m007["is_admin"], null)
  labs = try(local.m007["labs"], null)
  opt_in = try(local.m007["opt_in"], null)
  password = try(var.secrets["cml2_user.password"], local.m007["password"])
  resource_pool = try(local.m007["resource_pool"], null)
  resource_pool_template = try(local.m007["resource_pool_template"], null)
  username = try(local.m007["username"], null)
}
