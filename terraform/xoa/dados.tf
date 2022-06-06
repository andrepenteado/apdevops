data "xenorchestra_template" "ubuntu-20_04" {
  name_label = "Ubuntu Focal Fossa 20.04"
}

data "xenorchestra_network" "rede-eth0" {
  name_label = "Pool-wide network associated with eth0"
}