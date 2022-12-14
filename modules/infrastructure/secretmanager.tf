resource "google_secret_manager_secret" "factory_config_management" {
  project   = var.project
  secret_id = var.name
  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "factory_config_management" {
  secret      = google_secret_manager_secret.factory_config_management.id
  secret_data = tls_private_key.factory_config_management.private_key_pem
}
