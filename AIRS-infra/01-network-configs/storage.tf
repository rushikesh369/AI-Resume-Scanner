# Task 2.2 & 2.3: GCS Bucket with 24-hour Auto-Delete
resource "google_storage_bucket" "resume_bucket" {
  name                        = var.resume_bucket_name
  location                    = var.region
  uniform_bucket_level_access = true
  force_destroy               = true # Allows Terraform to destroy the bucket even if it contains files

  lifecycle_rule {
    condition {
      age = 1 # 1 Day (24 hours)
    }
    action {
      type = "Delete"
    }
  }
}