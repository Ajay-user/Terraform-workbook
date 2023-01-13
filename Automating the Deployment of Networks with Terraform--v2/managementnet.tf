# create a VPC net
resource "google_compute_network" "managementnet" {
  name = "managementnet"
  auto_create_subnetworks = false
}

# create a Subnet  
resource "google_compute_subnetwork" "managementsubnet-us" {
  name = "managementsubnet-us"
  region = "us-central1"
  network = google_compute_network.managementnet.self_link
  ip_cidr_range = "10.130.0.0/20"
}

# create a firewall
module "managementnet-allow-http-ssh-rdp-icmp" {
    source = "./firewall"
    firewall_name = "managementnet-allow-http-ssh-rdp-icmp"
    firewall_network =  google_compute_network.managementnet.self_link
}


# create a VM
module "managementnet-us-vm" {
  source = "./instance"
  instance_name = "managementnet-us-vm"
  instance_zone = "us-central1-a"
  instance_subnetwork = google_compute_subnetwork.managementsubnet-us.self_link
}