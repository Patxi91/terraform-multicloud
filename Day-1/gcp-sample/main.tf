provider "google" {
  credentials = file("test.json")
  project     = "aerobic-stream-438614-g1"
  region      = "us-central1"
}

resource "google_compute_instance" "default" {
  name         = "terraform-vm"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  # Boot disk configuration
  boot_disk {
    initialize_params {
      # Dynamically fetch the latest Debian image
      image = "debian-cloud/debian-11"
    }
  }


  # Network interface
  network_interface {
    network = "default"
    access_config {}
  }

  # Metadata allows you to set additional VM settings
  metadata = {
    ssh-keys = "user:ssh-rsa YOUR_SSH_PUBLIC_KEY"
  }
}
