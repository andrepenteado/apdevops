terraform {
  required_providers {
    xenorchestra = {
      source = "terra-farm/xenorchestra"
    }
  }
}

provider "xenorchestra" {
  url      = "ws://200.145.158.174"
  username = "root"
  password = "5sc0ntr0l3"
  insecure = true
}

data "xenorchestra_template" "ubuntu-template" {
  name_label = "vm-template"
}

data "xenorchestra_network" "rede-internet" {
  name_label = "Pool-wide network associated with eth0"
}

resource "xenorchestra_vm" "terraform-teste" {
  memory_max = 2147483648
  cpus  = 2
  name_label = "terraform-teste"
  name_description = "Teste de provisionamento com terraform"
  template = data.xenorchestra_template.ubuntu-template.id
  network {
    network_id = data.xenorchestra_network.rede-internet.id
  }
  disk {
    sr_id = "0e3dd968-ed2f-8b1f-51f4-0afc460ef145"
    name_label = "Disco de teste com terraform"
    size = 32212254720
  }
}