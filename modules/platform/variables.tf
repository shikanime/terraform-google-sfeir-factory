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

variable "gitlab_runner" {
  type = object({
    token              = string
    registration_token = string
  })
}
