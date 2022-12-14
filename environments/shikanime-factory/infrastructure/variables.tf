variable "name" {
  type        = string
  description = "Name of the tenant"
  default     = "factory"
}

variable "project" {
  type        = string
  description = "Project ID"
  default     = "par-router"
}

variable "region" {
  type        = string
  description = "Deployment region"
  default     = "europe-west9"
}

variable "zone" {
  type        = string
  description = "Deployment zone"
  default     = "europe-west9-b"
}

variable "sync" {
  type = object({
    repository = string
    branch     = string
    dir        = string
  })
  default = {
    repository = "git@gitlab.com:shikalegend/terraform-google-factory.git"
    branch     = "main"
    dir        = "."
  }
  description = "Git repository to sync"
}

variable "repositories" {
  type = map(object({
    name = string
  }))
  description = "Git repositories"
  default = {
    factory = {
      name = "shikalegend/terraform-google-factory"
    }
  }
}
