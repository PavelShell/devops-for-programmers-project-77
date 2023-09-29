resource "digitalocean_droplet" "web1" {
  name   = "web-1"
  size   = "s-1vcpu-1gb"
  image  = "ubuntu-20-04-x64"
  region = "nyc3"
}

resource "digitalocean_droplet" "web2" {
  name   = "web-1"
  size   = "s-1vcpu-1gb"
  image  = "ubuntu-20-04-x64"
  region = "nyc3"
}

resource "digitalocean_loadbalancer" "public" {
  name   = "loadbalancer-1"
  region = "nyc3"

  forwarding_rule {
    entry_port     = 80
    entry_protocol = "http"

    target_port     = 80
    target_protocol = "http"
  }

  healthcheck {
    port     = 22
    protocol = "tcp"
  }

  droplet_ids = [digitalocean_droplet.web1.id, digitalocean_droplet.web2.id]
}
 