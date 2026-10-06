#main.tf for gcs storage bucket
variable "name" {
  description = "GCS bucket name"
  type        = string
}
variable "project" {
  description = "GCP project ID"
  type        = string
}

resource "google_storage_bucket" "tf_state_prod" {
  name          = var.name
  location      = "US"
  project       = var.project
  force_destroy = true
  versioning {
    enabled = true
  }
  uniform_bucket_level_access = true
}