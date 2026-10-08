# Task 1.1: Custom VPC
resource "google_compute_network" "custom_vpc" {
  name                    = "airs-vpc"
  auto_create_subnetworks = false
}

# Task 1.2: Subnets & Secondary CIDRs for VPC-Native GKE
resource "google_compute_subnetwork" "gke_subnet" {
  name          = "airs-subnet-gke"
  network       = google_compute_network.custom_vpc.id
  region        = var.region
  ip_cidr_range = "10.0.0.0/24" # Primary Node CIDR

  secondary_ip_range {
    range_name    = "gke-pods-range"
    ip_cidr_range = "10.4.0.0/14"
  }

  secondary_ip_range {
    range_name    = "gke-services-range"
    ip_cidr_range = "10.0.16.0/20"
  }
}

# Task 1.3: Egress Routing (Cloud Router & Cloud NAT)
resource "google_compute_router" "router" {
  name    = "airs-router-nat"
  network = google_compute_network.custom_vpc.id
  region  = var.region
}

resource "google_compute_router_nat" "nat" {
  name                               = "airs-nat-egress"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}