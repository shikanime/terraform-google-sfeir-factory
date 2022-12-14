module "infrastructure" {
  source       = "../../../modules/infrastructure"
  name         = var.name
  project      = var.project
  region       = var.region
  zone         = var.zone
  sync         = var.sync
  repositories = var.repositories
}

module "devops" {
  source       = "../../../modules/devops"
  name         = var.name
  project      = var.project
  repositories = var.repositories
}
