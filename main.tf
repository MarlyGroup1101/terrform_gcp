
# This creates the google instance
resource "google_compute_instance" "vm_instance" {

  name         = "terraform-instance"
  machine_type = "f1-micro"
  zone         = "us-west2-b"

  boot_disk {
    initialize_params {
      image = var.image_name
    }
  }

  network_interface {
    network       = "default"

  }
  # We connect to our instance via Terraform and remotely executes our script using SSH
  provisioner "remote-exec" {
    script = "agent.sh"

    connection {
      type        = "ssh"
      host        = google_compute_address.static.address
      user        = var.username
      private_key = file("ssh")
    }
  }
}

# We create a public IP address for our google compute instance to utilize
resource "google_compute_address" "static" {
  name = "vm-public-address"
}
