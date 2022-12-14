data "google_secret_manager_secret" "factory_config_management" {
  project   = var.project
  secret_id = var.name
}

data "google_secret_manager_secret_version" "factory_config_management" {
  secret = data.google_secret_manager_secret.factory_config_management.id
}
