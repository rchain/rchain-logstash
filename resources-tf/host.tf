resource "google_compute_instance" "logstash_host" {
  name = "logstash"
  machine_type = "n1-standard-1"
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-minimal-1804-lts"
      size = 80
      type = "pd-standard"
    }
  }
  network_interface {
    network = "default"
    access_config {}
  }
}
