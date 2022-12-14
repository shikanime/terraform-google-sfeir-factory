module "platform" {
  source        = "../../../modules/platform"
  name          = var.name
  project       = var.project
  region        = var.region
  zone          = var.zone
  gitlab_runner = var.gitlab_runner
}
