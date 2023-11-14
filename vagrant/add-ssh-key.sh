#!/bin/bash
#
# Adicionar chave SSH pública no usuário root para acesso via ansible

mkdir -p /root/.ssh
touch /root/.ssh/authorized_keys
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHo3vg2j/DJIZGoGZBJXTnjJKbY7eP8ZHrnCRMVfPjNq André Penteado <andre.penteado@unesp.br>" >> /root/.ssh/authorized_keys
chmod 700 /root/.ssh
chmod 644 /root/.ssh/authorized_keys