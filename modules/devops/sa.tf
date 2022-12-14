resource "google_service_account" "gitlab_ci" {
  project      = var.project
  account_id   = "gitlab-ci"
  display_name = "Gitlab CI"
}

resource "google_project_iam_member" "gitlab_ci_artifactregistry_writer" {
  project = var.project
  role    = "roles/artifactregistry.writer"
  member  = "serviceAccount:${google_service_account.gitlab_ci.email}"
}

resource "google_project_iam_member" "gitlab_ci_storage_object_admin" {
  project = var.project
  role    = "roles/storage.objectAdmin"
  member  = "serviceAccount:${google_service_account.gitlab_ci.email}"
}

resource "google_service_account_key" "gitlab_ci" {
  service_account_id = google_service_account.gitlab_ci.name
}
