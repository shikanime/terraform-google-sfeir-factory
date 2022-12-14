terraform {
  required_version = "~> 1.2"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.40"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 4.40"
    }
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "~> 3.18"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }
}
