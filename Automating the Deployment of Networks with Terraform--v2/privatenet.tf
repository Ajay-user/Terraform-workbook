# create a VPC network

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

# create a Firewall
module "privatenet-allow-http-ssh-rdp-icmp" {
    source = "./firewall"
    firewall_name = "privatenet-allow-http-ssh-rdp-icmp"
    firewall_network =  google_compute_network.privatenet.self_link
}


# create a VM
module "privatenet-us-vm" {
  source = "./instance"
  instance_name = "privatenet-us-vm"
  instance_zone = "us-central1-a"
  instance_subnetwork = google_compute_subnetwork.privatesubnet-us.self_link
}