data "google_container_cluster" "factory" {
  project  = var.project
  name     = var.name
  location = var.zone
}
