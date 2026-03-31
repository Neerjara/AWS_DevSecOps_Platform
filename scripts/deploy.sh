#!/bin/bash

set -e

cd terraform

terraform init
terraform apply -auto-approve

CLUSTER=$(terraform output -raw cluster_name)

aws eks update-kubeconfig --name $CLUSTER

kubectl apply -f ../k8s/
