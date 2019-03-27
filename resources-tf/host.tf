resource "google_compute_instance" "logstash_host" {
  name = "logstash"
  machine_type = "n1-standard-2"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
      size = 80
      type = "pd-standard"
    }
  }

  tags = [ "logstash-tcp-in", "nagios-api-out" ]

  network_interface {
    network = "default"
    access_config {}
  }

  connection {
    type = "ssh"
    user = "root"
    private_key = "${file("~/.ssh/google_compute_engine")}"
  }

  provisioner "file" {
    source = "${var.rchain_sre_git_crypt_key_file}"
    destination = "/root/rchain-sre-git-crypt-key"
  }

  provisioner "remote-exec" {
    script = "../update-run-setup"
  }
}
