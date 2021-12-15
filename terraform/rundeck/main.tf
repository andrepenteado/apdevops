terraform {
  required_providers {
    rundeck = {
      source = "rundeck/rundeck"
      version = "0.4.2"
    }
  }
}

resource "rundeck_project" "sistemas-locais" {
    name = "Sistemas Locais"
    description = "Projeto de automação de depĺoy dos sistemas locais"
}