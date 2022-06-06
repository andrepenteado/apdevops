terraform {
  required_providers {
    xenorchestra = {
      source = "terra-farm/xenorchestra"
    }
  }
  backend "http" {
  }
}

provider "xenorchestra" {
  url      = "ws://200.145.158.174"
  username = "root"
  password = "5sc0ntr0l3"
  insecure = true
}