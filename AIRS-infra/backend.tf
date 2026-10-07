terraform {
  backend "gcs" {
    bucket  = "airs-terraform-state"
    prefix  = "terraform/state"
  }
}