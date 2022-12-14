resource "kubernetes_secret" "factory_config_management" {
  metadata {
    name      = "git-creds"
    namespace = data.kubernetes_namespace.factory_config_management_system.metadata.0.name
  }
  data = {
    ssh = data.google_secret_manager_secret_version.factory_config_management.secret_data
  }
}
resource "kubernetes_secret" "factory_gitlab_runner" {
  metadata {
    name      = "gitlab-runner"
    namespace = data.kubernetes_namespace.factory_gitlab_runner.metadata.0.name
  }
  data = {
    token              = var.gitlab_runner.token
    registration_token = var.gitlab_runner.registration_token
  }
}
