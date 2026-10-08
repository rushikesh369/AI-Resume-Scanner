variable "project_id" {
  type        = string
  description = "GCP Project ID"
}

variable "region" {
  type        = string
  description = "GCP Region for deployment"
  default     = "us-central1"
}

variable "resume_bucket_name" {
  type        = string
  description = "Globally unique GCS bucket name for uploaded resumes"
}