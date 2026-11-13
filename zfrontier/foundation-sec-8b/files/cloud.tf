provider "google" {
  project = "my-project"
  region  = "us-central1"
}

resource "google_compute_network" "default" {
  name                    = "default-network"
  auto_create_subnetworks = true
}

resource "google_compute_firewall" "allow_all_inbound" {
  name    = "allow-all-inbound"
  network = google_compute_network.default.name

  direction = "INGRESS"
  priority  = 1000

  allows {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  allows {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  source_ranges = ["0.0.0.0/0"]

  target_tags = ["web"]
  description = "Allow all inbound traffic from any IP on all ports"
}