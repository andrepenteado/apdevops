provider "gitlab" {
  token = "<seu-token-pessoal>"
}

resource "gitlab_project" "sistemas-locais" {
  name        = "Sistemas Locais"
  description = "Código de implantação dos sistemas locais"
  namespace_id = "5005248"
  pipelines_enabled = "false"
  visibility_level = "private"
  container_registry_enabled = "false"
}
