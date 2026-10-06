module "vpc" {
  source = "./modules/modules_VPC"
  vpc_name = "airs-vpc"
  project = "airs-509504"
  subnet_name = "airs-subnet"
  subnet_ip_range = "10.0.1.0/29"
  region = "us-central1"
}

# module "storage" {
#   source = "./modules/modules_storage"
#   name = "airs-terraform-state"
#   project = "airs-509504"
# }

