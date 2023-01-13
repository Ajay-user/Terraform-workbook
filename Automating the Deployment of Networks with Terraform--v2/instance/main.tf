

variable "instance_name" { }
variable "instance_zone" { }
variable "instance_type" { default = "n1-standard-1" }
variable "instance_subnetwork" { }



# create a VM
resource "google_compute_instance" "vm-instance" {
  name = var.instance_name
  zone = var.instance_zone
  machine_type = var.instance_type

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    subnetwork = var.instance_subnetwork
    access_config {
    #   leave it empty -- this will create an ephemeral external IP
    }
  }
}