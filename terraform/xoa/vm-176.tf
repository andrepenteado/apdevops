resource "xenorchestra_vm" "vm-200_145_158_176" {
  memory_max = 2147483648
  cpus  = 2
  name_label = "vm-200_145_158_176"
  name_description = "VM de IP 200.145.158.176"
  template = data.xenorchestra_template.ubuntu-20_04.id
  network {
    network_id = data.xenorchestra_network.rede-eth0.id
  }
  disk {
    sr_id = "0e3dd968-ed2f-8b1f-51f4-0afc460ef145"
    name_label = "Disco da vm-200_145_158_176"
    size = 32212254720
  }
  provisioner "remote-exec" {
    connection {
      type = "ssh"
      user = "root"
      host = "200.145.167.49"
      private_key = file("~/.ssh/ansible.key")
    }
    inline = [
      "sed -i 's/200.145.167.49/200.145.158.176/g' /etc/netplan/00-installer-config.yaml",
      "netplan apply"
    ]
  }
}