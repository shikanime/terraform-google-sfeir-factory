variable "name" {
  type        = string
  description = "Name of the tenant"
}

variable "project" {
  type        = string
  description = "Project ID"
}

variable "repositories" {
  type = map(object({
    name = string
  }))
  description = "Git repositories"
}
