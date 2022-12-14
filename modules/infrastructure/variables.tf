variable "name" {
  type        = string
  description = "Name of the tenant"
}

variable "project" {
  type        = string
  description = "Project ID"
}

variable "region" {
  type        = string
  description = "Deployment region"
}

variable "zone" {
  type        = string
  description = "Deployment zone"
}

variable "sync" {
  type = object({
    repository = string
    branch     = string
    dir        = string
  })
}

variable "repositories" {
  type = map(object({
    name = string
  }))
  description = "Git repositories"
}
