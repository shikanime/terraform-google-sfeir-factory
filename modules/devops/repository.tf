resource "gitlab_project_variable" "google_application_credentials" {
  for_each      = var.repositories
  project       = each.value.name
  key           = "GOOGLE_APPLICATION_CREDENTIALS"
  value         = base64decode(google_service_account_key.gitlab_ci.private_key)
  protected     = false
  variable_type = "file"
}
