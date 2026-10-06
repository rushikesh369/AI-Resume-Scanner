module "vpc" {
  source = "./modules/modules_VPC"
  vpc_name = "AIRS-vpc"
  project = "airs-509504"
  subnet_name = "AIRS-subnet"
  subnet_ip_range = "10.0.1.0/29"
  region = "us-central1"
}
