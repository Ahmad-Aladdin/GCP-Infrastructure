resource "google_compute_firewall" "allow_ssh" {
  project     = var.project_name
  name        = "allow-ssh"
  network     =  var.vpc_name
  description = "Creates firewall rule targeting tagged instances"
  direction = "INGRESS"
  source_ranges = [ "35.235.240.0/20" ]

  depends_on = [
    module.network
  ]

  allow {
    protocol  = "tcp"
    ports     = ["22"]
  }

}