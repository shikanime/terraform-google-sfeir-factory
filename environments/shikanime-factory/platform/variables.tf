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

variable "gitlab_runner" {
  type = object({
    token              = string
    registration_token = string
  })
}
