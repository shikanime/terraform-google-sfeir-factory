terraform {
  required_version = "~> 1.2"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.40"
    }
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "~> 3.18"
    }
  }
}
