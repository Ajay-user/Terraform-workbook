

variable "firewall_name" { }
variable "firewall_network" { }
variable "firewall_source_range" { default = ["0.0.0.0/0"]}



# create a firewall
resource "google_compute_firewall" "network-allow-http-ssh-rdp-icmp" {
  name = var.firewall_name
  network = var.firewall_network
  source_ranges = var.firewall_source_range
  allow {
    protocol = "tcp"
    ports = [ "80", "22", "3389" ]
  }
  allow {
    protocol = "icmp"
  }
}
