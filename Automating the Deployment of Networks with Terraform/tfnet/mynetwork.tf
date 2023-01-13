
# create a VPC network
resource "google_compute_network" "mynetwork" {
  name = "mynetworks"
  auto_create_subnetworks = true
}

# an auto-mode network automatically creates a subnetwork in each region.


# create a Firewall
resource "google_compute_firewall" "mynetwork-allow-http-ssh-rdp-icmp" {
  name = "mynetwork-allow-http-ssh-rdp-icmp"
  network = google_compute_network.mynetwork.self_link
  source_ranges = [ "0.0.0.0/0" ]
  allow {
    protocol = "tcp"
    ports = [ "80", "22", "3389" ]
  }
  allow {
    protocol = "icmp"
  }
}

# VM instance in US
module "mynet-us-vm" {
  source = "./instance"
  instance_name = "mynet-us-vm"
  instance_zone = "us-central1-a"
  instance_subnetwork = google_compute_network.mynetwork.self_link
}

# VM instance in EU
module "mynet-us-vm" {
  source = "./instance"
  instance_name = "mynet-eu-vm"
  instance_zone = "europe-west1-d"
  instance_subnetwork = google_compute_network.mynetwork.self_link
}
