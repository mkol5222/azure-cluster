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
}

# sic_key
variable "sic_key" {
    type = string
}