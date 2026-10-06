#variable block
variable vpc_name {
    type = string
}
variable "project" {
    type = string 
}
variable "subnet_name" {
    type = string
}
variable "subnet_ip_range" {
    type = string
}
variable "region" {
    type = string
}

resource "google_compute_network" "vpc_network" {
    name = var.vpc_name
    auto_create_subnetworks = false
    project = var.project
}

resource "google_compute_subnetwork" "subnet" {
    name          = var.subnet_name
    ip_cidr_range = var.subnet_ip_range
    region        = var.region
    network       = google_compute_network.vpc_network.id
    project       = var.project
  
}

# resource "google_compute_firewall" "firewall" {
#     name    = ""
#     network = google_compute_network.vpc_network.id
#     project = var.project
  
#     allow {
#         protocol = "tcp"
#         ports    = ["22", "80", "443"]
#     }
  
#     source_ranges = ["0.0.0.0/0"]       