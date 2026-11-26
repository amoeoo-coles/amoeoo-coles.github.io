# Combined configuration: every catalogue file in tf/ (706 files,
# 348 resources and 358 data sources) in build order.
# Use it to validate the whole tree:
#   terraform init -backend=false && terraform validate
# Do NOT apply this as-is: it declares every object type with REPLACE_ME
# placeholders. Copy the tf/NNN_*.tf files you need, with their models/*.yml,
# into your own root module and fill the model values first.

module "catalogue" {
  source = "./tf"
}
