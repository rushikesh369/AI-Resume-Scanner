terraform {
 backend "gcs" {
   bucket  = "bkt-tfstate-000"
   prefix  = "tf/state"
 }
}
