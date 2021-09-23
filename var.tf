variable "GOOGLE_CREDENTIALS" {
}

variable "PROJECT" {
}

variable "REGION" {
  default = "us-west4"
}

variable "machine_size" {
  type        = "string"
  description = "The size that this instance will be."
  default     = "f1-micro"
}

variable "image_name" {
  type        = "string"
  description = "The kind of VM this instance will become"
  default     = "ubuntu-os-cloud/ubuntu-1804-bionic-v20190403"
}

variable "script_path" {
  type        = "string"
  description = "Where is the path to the script locally on the machine?"
}

