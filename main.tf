variable "google_credentials" {
  description = "the contents of a service account key file in JSON format."
  type = string
}

provider "google" {
  credentials = ${var.google_credentials}
  project     = "just-amp-325919"
  region      = "us-west4"

}

resource "google_compute_instance" "vm_instance" {
  name         = "cred_cloud"
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
#new
