resource "google_compute_instance" "vm_instance" {
  name         = "demoddd1"
  machine_type = "f1-micro"
  zone         = "us-west4-b"


  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"

  }
}
