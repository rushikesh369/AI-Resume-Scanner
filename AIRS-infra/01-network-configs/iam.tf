# Task 3.1: Application Service Account
resource "google_service_account" "app_gsa" {
  account_id   = "airs-app-gsa"
  display_name = "AI Resume Application GSA"
}

# Task 3.2: Scoped IAM Binding for GCS
resource "google_storage_bucket_iam_member" "gsa_bucket_access" {
  bucket = google_storage_bucket.resume_bucket.name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_service_account.app_gsa.email}"
}