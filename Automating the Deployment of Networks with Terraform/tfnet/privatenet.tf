# create a VPC net
resource "google_compute_network" "privatenet" {
  name = "privatenet"
  auto_create_subnetworks = false
}


# create a Subnet in US
resource "google_compute_subnetwork" "privatesubnet-us" {
  name = "privatesubnet-us"
  network = google_compute_network.privatenet.self_link
  region = "us-central1"
  ip_cidr_range = "172.16.0.0/24"
} 


# create a Subnet in EU
resource "google_compute_subnetwork" "privatesubnet-eu" {
  name = "privatesubnet-eu"
  network = google_compute_network.privatenet.self_link
  region = "europe-west1"
  ip_cidr_range = "172.20.0.0/20"
} 

# create a firewall
resource "google_compute_firewall" "privatenet-allow-http-ssh-rdp-icmp" {
  name = "privatenet-allow-http-ssh-rdp-icmp"
  network = google_compute_network.privatenet.self_link
  source_ranges = [ "0.0.0.0/0" ]
  allow {
    protocol = "tcp"
    ports = [ "80", "22", "3389" ]
  }
   allow {
     protocol = "icmp"
   }
}

# create a VM
module "privatenet-us-vm" {
  source = "./instance"
  instance_name = "privatenet-us-vm"
  instance_zone = "us-central1-a"
  instance_subnetwork = google_compute_subnetwork.privatesubnet-us.self_link
}



