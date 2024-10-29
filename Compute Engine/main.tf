terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  project = "ab-gcp-project"
}

resource "google_compute_instance" "terraform-compute-engine" {
  name         = "terraform-new-instance"
  machine_type = "f1-micro"
  zone         = "us-central1-c"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
  }
}

network_interface {
    network = "default"
    access_config {
    }
  }
}