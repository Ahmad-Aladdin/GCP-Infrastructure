resource "google_compute_subnetwork" "subnet-1" {
  name          = var.subnet-1_name
  ip_cidr_range = var.subnet-1_cidr
  region        = var.subnet-1_region
  network       = google_compute_network.vpc_network.id
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "subnet-2" {
  name          = var.subnet-2_name
  ip_cidr_range = var.subnet-2_cidr
  region        = var.subnet-2_region
  network       = google_compute_network.vpc_network.id
  private_ip_google_access = true
}

resource "google_compute_router_nat" "nat-gateway" {
  name                               = "my-router-nat"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name                    = google_compute_subnetwork.subnet-2.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}

resource "google_compute_router" "router" {
  name    = "my-router"
  region  = google_compute_subnetwork.subnet-2.region
  network = google_compute_network.vpc_network.id
}