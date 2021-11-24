resource "google_compute_instance" "vm_instance" {
  name         = "qwerd111"
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

#Example Usage - Single User
resource "google_storage_bucket" "bucket" {
  name     = "test-bucket"
  location = "US"
}

resource "google_storage_bucket_object" "archive" {
  name   = "index.zip"
  bucket = google_storage_bucket.bucket.name
  source = ""
}

resource "google_cloudfunctions_function" "function" {
  name        = "function-test"
  description = "My function"
  runtime     = "nodejs14"

  available_memory_mb   = 128
  source_archive_bucket = google_storage_bucket.bucket.name
  source_archive_object = google_storage_bucket_object.archive.name
  trigger_http          = true
  timeout               = 60
  entry_point           = "helloGET"
  labels = {
    my-label = "my-label-value"
  }

  environment_variables = {
    MY_ENV_VAR = "my-env-var-value"
  }
}

# IAM entry for a single user to invoke the function
resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = google_cloudfunctions_function.function.project
  region         = google_cloudfunctions_function.function.region
  cloud_function = google_cloudfunctions_function.function.name

  role   = "roles/cloudfunctions.invoker"
  member = "user:myFunctionInvoker@example.com"
}
