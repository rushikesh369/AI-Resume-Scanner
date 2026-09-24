resource "google_storage_bucket" "my-bucket" {
  name                     = "rushi-test-demo-1710"
  location                 = "us-central1"
  project                  = "airs-509504"
  force_destroy            = true
  public_access_prevention = "enforced"

  uniform_bucket_level_access = true
}

resource "google_storage_bucket" "my-bucket2" {
  name                     = "rushi-test-demo-002"
  location                 = "us-central1"
  project                  = "airs-509504"
  force_destroy            = true
  public_access_prevention = "enforced"

  uniform_bucket_level_access = true
}
