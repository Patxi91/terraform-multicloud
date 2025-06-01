provider "google" {
  credentials = file("crucial-study-397313-d99cb5554ead.json")
  project     = "crucial-study-397313"
  region      = "europe-north1"
}

resource "google_compute_instance" "default" {
  name         = "terraform-vm"
  machine_type = "e2-medium"
  zone         = "europe-north1-a"

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
