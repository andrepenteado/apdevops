#!/bin/bash
#
# Instalar K3S server em single node

# Instalar através de script
curl -sfL https://get.k3s.io | sh -s - server --cluster-init --disable=traefik --datastore-certfile=/root/apcode.crt --datastore-keyfile=/root/apcode.key --tls-san=cluster.apcode.com.br

# Copiar arquivo de configuração (mudar do IP para URL cluster.apcode.com.br em clientes remotos)
mkdir ~/.kube
cp /etc/rancher/k3s/k3s.yaml .kube/config

### Autocomplete ###
source <(kubectl completion bash)
echo "source <(kubectl completion bash)" >> ~/.bashrc
source <(kubectl completion zsh)
echo '[[ $commands[kubectl] ]] && source <(kubectl completion zsh)' >> ~/.zshrc