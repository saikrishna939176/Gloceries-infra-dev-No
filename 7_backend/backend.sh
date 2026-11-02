#!/bin/bash
component=$1
environment=$2
dnf install ansible -y
pip3.9 install boto3 botocore
ansible-pull -i https://github.com/daws-78s/expense-ansible-roles-tf.git main.yaml -e component=$component -e environment=$environment