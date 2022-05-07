resource "google_compute_instance" "management-vm" {
  name         = "management-vm"
  machine_type = "e2-micro"
  zone         = "${module.network.subnet-2_region}-b"
  allow_stopping_for_update = true
  
  service_account {
    email = google_service_account.ServiceAccounnt.email
    scopes = [ "cloud-platform" ]
  }

  depends_on = [
    module.network,
    google_compute_firewall.allow_ssh
  ]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      type = "pd-standard"
      size = 10
    }
  }


  network_interface {
    network = module.network.vpc_name
    subnetwork = module.network.subnet-2_name
  }
}