terraform {
  required_version = "~> 1.2"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.40"
    }
    time = {
      source  = "hashicorp/time"
      version = "~> 0.9"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.14"
    }
  }
}

provider "kubernetes" {
  host                   = "https://${data.google_container_cluster.factory.endpoint}"
  token                  = data.google_client_config.current.access_token
  client_certificate     = base64decode(data.google_container_cluster.factory.master_auth.0.client_certificate)
  client_key             = base64decode(data.google_container_cluster.factory.master_auth.0.client_key)
  cluster_ca_certificate = base64decode(data.google_container_cluster.factory.master_auth.0.cluster_ca_certificate)
}
