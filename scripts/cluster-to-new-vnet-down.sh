#!/bin/bash

set -euo pipefail

envId=$(dotenvx get TF_VAR_envId)
echo "Using envId: ${envId}"



# cluster
# export TF_VAR_existing_vnet_resource_group="cluster-vnet-${envId}"
export TF_VAR_address_space="192.168.0.0/16"
export TF_VAR_subnet_prefixes="192.168.1.0/24,192.168.2.0/24"
export TF_VAR_frontend_subnet_name="NewFrontend"
export TF_VAR_backend_subnet_name="NewBackend"

make cluster-down

# VNET not deployed
# make vnet-down