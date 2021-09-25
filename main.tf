resource "google_compute_instance" "vm_instance" {
  name         = "demoddd1"
  machine_type = "f1-micro"
  zone         = "us-west4-b"

# Locks the version of Terraform for this particular use case
terraform {
  required_version = "~>0.12.0"
}
  
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"

  }
}
