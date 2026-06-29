variable "envId" {
  description = "Environment ID"
  type        = string
}

variable "tenant" {
  description = "Azure Tenant ID"
  type        = string
}

variable "subscriptionId" {
  description = "Azure Subscription ID"
  type        = string
}

variable "appId" {
  description = "Azure Service Principal App ID"
  type        = string
}

variable "password" {
  description = "Azure Service Principal Password"
  type        = string
}

variable "admin_password" {
    description = "VM admin password"
    type = string
    sensitive = true
    default = "Welcom3Home3!"
}

# sic_key
variable "sic_key" {
    type = string
    default = "SICKEY1234567890"
    sensitive = true
}

// var.smart1_token_a
// var.smart1_token_b
variable "smart1_token_a" {
    type = string
    default =""
}
variable "smart1_token_b" {
    type = string
    default =""
}

variable "new-vnet" {
  description = "Create new vnet"
  type        = bool
  default     = false
}

/// which network/subnets to use for the cluster, if new-vnet is false, then these network/subnets will be created
  # vnet_name                       = "checkpoint-ha-vnet"
  # frontend_subnet_name            = "Frontend"
  # backend_subnet_name             = "Backend"
  # address_space                   = "10.0.0.0/16"
  # subnet_prefixes                 = ["10.0.1.0/24", "10.0.2.0/24"]

  variable "vnet_name" {
    description = "VNET name"
    type        = string
    default     = "checkpoint-ha-vnet"
  }

  variable "frontend_subnet_name" {
    description = "Frontend Subnet name"
    type        = string
    default     = "Frontend"
  }

  variable "backend_subnet_name" {
    description = "Backend Subnet name"
    type        = string
    default     = "Backend"
  }

  variable "address_space" {
    description = "VNET address space"
    type        = string
    default     = "10.0.0.0/16"
  }

  variable "subnet_prefixes" {
    description = "Subnet prefixes"
    type        = list(string)
    default     = ["10.0.1.0/24", "10.0.2.0/24"]
  }

  variable "existing_vnet_resource_group" {
    description = "Resource group of the existing VNET"
    type        = string
    default     = ""
  }