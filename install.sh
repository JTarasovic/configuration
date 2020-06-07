#!/bin/bash


pushd ansible || exit 1
ansible-galaxy role install -r requirements.yaml
ansible-galaxy collection install -r requirements.yaml
ansible-playbook -i inventory.ini main.yaml -K --ask-vault-pass
popd || exit 1
