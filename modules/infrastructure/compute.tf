resource "google_compute_network" "factory" {
  project = var.project
  name    = var.name
}
