resource "google_compute_instance" "logstash_host" {
  name = "logstash"
  machine_type = "n1-standard-2"
  tags = [ "logstash-tcp-in" ]
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
      size = 80
      type = "pd-standard"
    }
  }
  network_interface {
    network = "default"
    access_config {}
  }
  provisioner "remote-exec" {
    connection {
      type = "ssh"
      user = "root"
      private_key = "${file("~/.ssh/google_compute_engine")}"
    }
    script = "../update-run-setup"
  }
}
