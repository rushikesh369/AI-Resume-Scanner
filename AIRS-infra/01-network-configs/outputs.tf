output "network_name" {
  value       = google_compute_network.custom_vpc.name
  description = "The name of the custom VPC"
}

output "subnet_name" {
  value       = google_compute_subnetwork.gke_subnet.name
  description = "The name of the GKE subnet"
}

output "pods_range_name" {
  value       = google_compute_subnetwork.gke_subnet.secondary_ip_range[0].range_name
  description = "The secondary CIDR range name for GKE Pods"
}

output "services_range_name" {
  value       = google_compute_subnetwork.gke_subnet.secondary_ip_range[1].range_name
  description = "The secondary CIDR range name for GKE Services"
}

output "app_gsa_email" {
  value       = google_service_account.app_gsa.email
  description = "The email of the Application GSA for Workload Identity"
}