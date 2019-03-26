data "google_compute_network" "default_network" {
  name = "default"
}

resource "google_compute_firewall" "fw_logstash_tcp" {
  name = "logstash-tcp"
  network = "${data.google_compute_network.default_network.self_link}"
  priority = 500
  source_tags = [ "logstash-tcp-out" ]
  target_tags = [ "logstash-tcp-in" ]
  allow {
    protocol = "tcp"
    ports = [ 4560 ]
  }
}
