# Example remote backend configuration. Copy to a private automation repo.
# Fill in real endpoints via runner environment or additional -backend-config
# arguments. Do not commit credentials, tokens or bucket keys.
#
# terraform {
#   backend "http" {
#     address        = "https://state.example.invalid/states/aci-example"
#     lock_address   = "https://state.example.invalid/states/aci-example/lock"
#     unlock_address = "https://state.example.invalid/states/aci-example/lock"
#     username       = "TF_HTTP_USERNAME"
#     password       = "TF_HTTP_PASSWORD"
#   }
# }
#
# Alternative (S3-compatible) sketch — bucket name and credentials are not collected:
# terraform {
#   backend "s3" {
#     bucket         = "example-tfstate-not-collected"
#     key            = "aci/example/terraform.tfstate"
#     region         = "not-collected"
#     dynamodb_table = "example-tflock-not-collected"
#     encrypt        = true
#   }
# }

address        = "https://state.example.invalid/states/aci-example"
lock_address   = "https://state.example.invalid/states/aci-example/lock"
unlock_address = "https://state.example.invalid/states/aci-example/lock"
lock_method    = "POST"
unlock_method  = "DELETE"
