provider "azurerm" {
  features {}
}

module "example_module" {
  source  = "CheckPointSW/cloudguard-network-security/azure//modules/high-availability"
  version = "~> 1.0"

  # Authentication Variables
  client_secret                   = var.password
  client_id                       = var.appId
  tenant_id                       = var.tenant
  subscription_id                 = var.subscriptionId

  resource_group_name = "cluster-${var.envId}"
  cluster_name        = "has-${var.envId}"
  location            = "westeurope"
  extended_zone       = "None"
  tags                = {}

  # Virtual Machine Instances Variables
  source_image_vhd_uri           = "noCustomUri"
  authentication_type            = "Password"
  admin_password                 = var.admin_password
  sic_key                        = var.sic_key
  serial_console_password_hash   = ""
  maintenance_mode_password_hash = ""
  vm_size                        = "Standard_D4ds_v5"
  disk_size                      = "200"
  os_version                     = "R82"
  vm_os_sku                      = "sg-byol"
  vm_os_offer                    = "check-point-cg-r82"
  allow_upload_download          = true
  admin_shell                    = "/etc/cli.sh"
  bootstrap_script               = "touch /home/admin/bootstrap.txt; echo 'hello_world' > /home/admin/bootstrap.txt"
  enable_custom_metrics          = true
  availability_type              = "Availability Zone"
  availability_zones             = ["1", "2"]

  # Smart-1 Cloud Variables
  smart_1_cloud_token_a = var.smart1_token_a
  smart_1_cloud_token_b = var.smart1_token_a

  # Networking Variables
  vnet_name                       = "checkpoint-ha-vnet"
  frontend_subnet_name            = "Frontend"
  backend_subnet_name             = "Backend"
  address_space                   = "10.0.0.0/16"
  subnet_prefixes                 = ["10.0.1.0/24", "10.0.2.0/24"]
  nsg_id                          = ""
  storage_account_deployment_mode = "New"
  storage_account_type            = "Standard_LRS"
  add_storage_account_ip_rules    = false
  storage_account_additional_ips  = []
  vips_names                      = []

  # Load Balancers Variables
  enable_floating_ip           = true
  use_public_ip_prefix         = false
  create_public_ip_prefix      = false
  existing_public_ip_prefix_id = ""
}