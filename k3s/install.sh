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

# Rancher
kubectl create namespace cattle-system
helm install rancher rancher-latest/rancher  \
     --namespace cattle-system               \
     --set hostname=rancher.apcode.com.br    \
     --set bootstrapPassword=passwebra       \
     --set ingress.tls.source=secret

# Caso de incopatibilidade de versão (substitua a versão para o correspondente downgrade)
#wget https://github.com/k3s-io/k3s/releases/download/v1.27.10%2Bk3s1/k3s
#cp k3s /usr/local/bin/
#systemctl restart k3s
#helm install rancher rancher-latest/rancher  \
#     --namespace cattle-system               \
#     --set hostname=rancher.apcode.com.br    \
#     --set bootstrapPassword=passwebra       \
#     --set ingress.tls.source=secret         \
#     --set ingress.ingressClassName=traefik  \
#     --set ingress.extraAnnotations.'traefik\.ingress\.kubernetes\.io/router.entrypoints'=websecure \
#     --set ingress.extraAnnotations.'traefik\.ingress\.kubernetes\.io/router.tls'=true