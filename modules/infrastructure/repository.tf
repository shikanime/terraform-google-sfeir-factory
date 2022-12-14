resource "gitlab_deploy_key" "factory_config_management" {
  project = var.repositories.factory.name
  title   = "Config Management (${google_container_cluster.factory.name})"
  key     = tls_private_key.factory_config_management.public_key_openssh
}
