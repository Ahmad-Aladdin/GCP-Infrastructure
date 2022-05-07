output "vpc_name" {
    value = google_compute_network.vpc_network.name
}

output "subnet-1_region" {
    value = google_compute_subnetwork.subnet-1.region
}

output "subnet-2_region" {
    value = google_compute_subnetwork.subnet-2.region
}

output "subnet-1_name" {
    value = google_compute_subnetwork.subnet-1.name
}

output "subnet-2_name" {
    value = google_compute_subnetwork.subnet-2.name
}

