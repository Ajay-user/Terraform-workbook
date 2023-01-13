
# create a VM
resource "google_compute_network" "mynetwork" {
  name = "mynetwork"
  auto_create_subnetworks = true
}

# subnets will be created automatically


# create a firewall
module "mynetwork-allow-http-ssh-rdp-icmp" {
  source = "./firewall"
  firewall_name = "mynetwork-allow-http-ssh-rdp-icmp"
  firewall_network = google_compute_network.mynetwork.self_link
}

# create a VM in US
module "mynet-us-vm" {
  source = "./instance"
  instance_name = "mynet-us-vm"
  instance_zone = "us-central1-a"
  instance_subnetwork = google_compute_network.mynetwork.self_link
}

# create a VM in EU
module "mynet-eu-vm" {
  source = "./instance"
  instance_name = "mynet-eu-vm"
  instance_zone = "europe-west1-d"
  instance_subnetwork = google_compute_network.mynetwork.self_link
}