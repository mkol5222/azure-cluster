#!/bin/bash

set -euo pipefail

envId=$(dotenvx get TF_VAR_envId)
echo "Using envId: ${envId}"

# VNET first
make vnet-up

# then cluster
export TF_VAR_existing_vnet_resource_group="cluster-vnet-${envId}"
export TF_VAR_vnet_name="checkpoint-ha-vnet"
export TF_VAR_address_space=""
unset TF_VAR_subnet_prefixes
export TF_VAR_frontend_subnet_name="Frontend"
export TF_VAR_backend_subnet_name="Backend"

make cluster-up