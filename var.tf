
variable "machine_size" {
  type        = string
  description = "The size that this instance will be."
  default     = "f1-micro"
}

variable "image_name" {
  type        = string
  description = "The kind of VM this instance will become"
  default     = "ubuntu-os-cloud/ubuntu-1804-bionic-v20190403"
}

variable "script_path" {
  type        = string
  description = "Where is the path to the script locally on the machine?"
}

variable "username" {
  type        = string
  description = "The name of the user that will be used to remote exec the script"
  default     = "terraform-demo@just-amp-325919.iam.gserviceaccount.com"
}
