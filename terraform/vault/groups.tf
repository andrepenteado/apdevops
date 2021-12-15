resource "vault_identity_group" "unespfc" {
  name     = "Unesp/FC"
  policies = ["user"]
  metadata = {
    version = "2"
  }
}
