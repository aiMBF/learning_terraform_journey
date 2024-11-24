resource "google_dns_managed_zone" "blog_zone" {
  name     = "peripeties"
  dns_name = "peripeties.com."
}

resource "google_dns_record_set" "blog_record" {
  name         = "peripeties.com."
  type         = "A"
  ttl          = 300
  managed_zone = google_dns_managed_zone.blog_zone.name
  rrdatas      = [google_compute_instance.blog_instance.network_interface.0.access_config.0.nat_ip]
}
