resource "google_compute_instance" "blog_instance" {
  name         = "blog-instance"
  machine_type = "f1-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  tags = ["peripeties", "http-server", "https-server"]

  metadata_startup_script = <<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y apache2
    echo '<h1>Bienvenue dans mes peripeties quotidiennes </h1>' > /var/www/html/index.html
    systemctl restart apache2
  EOF
}

# Firewall rules for HTTP and HTTPS
resource "google_compute_firewall" "default" {
  name    = "default-allow-http-https"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server", "https-server"]
}
