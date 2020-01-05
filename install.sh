#!/bin/bash

ansible-galaxy install -r ansible/requirements.yaml

pushd ansible
ansible-playbook -i inventory.ini main.yaml -K
popd
