output "debug" {
  value = {
    admin_password = var.admin_password
    sic_key = var.sic_key
    modules = [module.cluster1]
  }
  sensitive = true
}