
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

