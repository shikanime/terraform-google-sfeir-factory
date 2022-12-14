resource "time_sleep" "wait_for_configmanagement_sync" {
  create_duration = "45s"
  triggers = {
    ssh = kubernetes_secret.factory_config_management.data.ssh
  }
}

data "kubernetes_namespace" "factory_config_management_system" {
  metadata {
    name = "config-management-system"
  }
}

data "kubernetes_namespace" "factory_gitlab_runner" {
  metadata {
    name = "gitlab-runner"
  }
}
