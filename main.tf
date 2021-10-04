resource "google_compute_instance" "vm_instance" {
  name         = "devserver1212"
  machine_type = "f1-micro"
   zone        = "us-west4-b"
  
  tags         = ["externalssh","webserver"]
  
  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }
  network_interface {
    network = "default"

    
  }
}


    
  }
}
