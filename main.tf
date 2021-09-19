provider "google" {
  credentials = file("service-account.json")
  project     = "just-amp-325919"
  region      = "us-west4"

}

resource "google_compute_instance" "vm_instance" {
  name         = "demo1"
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

resource "google_compute_instance" "default" {
  name         = "demo11"
  machine_type = "f1-micro"
  zone         = "us-west2-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"

  }
}

resource "google_compute_instance" "default" {
  name         = "demo2"
  machine_type = "f1-micro"
  zone         = "us-west2-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"

  }
}

resource "google_compute_instance" "default1" {
  name         = "demo3"
  machine_type = "f1-micro"
  zone         = "us-west2-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"

  }
}
#works and can create VM in play environments

module "agent_policy" {
  source     = "terraform-google-modules/cloud-operations/google//modules/agent-policy"
  version    = "~> 0.2.1"
  project_id = "just-amp-325919"
  policy_id  = "ops-agents-policy"

  agent_rules = [
    {
      type               = "ops-agent"
      version            = "current-major"
      package_state      = "installed"
      enable_autoupgrade = true
    },
  ]
  os_types = [
    {
      short_name = "centos"
    },
    {
      short_name = "debian"
    },
    {
      short_name = "rhel"
    },
    {
      short_name = "sles"
    },
    {
      short_name = "sles_sap"
    },
    {
      short_name = "ubuntu"
    },
  ]
}
