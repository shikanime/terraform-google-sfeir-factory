terraform {
  backend "gcs" {
    bucket = "par-router-terraform"
    prefix = "infrastructure"
  }
}
