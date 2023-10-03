resource "digitalocean_database_cluster" "postgres" {
  name       = "db"
  engine     = "pg"
  version    = "14"
  size       = "db-s-1vcpu-1gb"
  region     = "fra1"
  node_count = 1
}

data "digitalocean_ssh_key" "default" {
  name = "Home PC key"
}

data "local_file" "private_key" {
  filename = "keys/id_rsa"
}

resource "digitalocean_droplet" "app_node_1" {
  name   = "node-1"
  size   = "s-1vcpu-1gb"
  image  = "docker-20-04"
  region = "fra1"
  depends_on = [digitalocean_database_cluster.postgres]
	ssh_keys = [data.digitalocean_ssh_key.default.fingerprint]
}

resource "digitalocean_droplet" "app_node_2" {
  name   = "node-2"
  size   = "s-1vcpu-1gb"
  image  = "docker-20-04"
  region = "fra1"
  depends_on = [digitalocean_database_cluster.postgres]
	ssh_keys = [data.digitalocean_ssh_key.default.fingerprint]
}

resource "digitalocean_loadbalancer" "load_balancer" {
  name   = "loadbalancer"
  region = "fra1"

  forwarding_rule {
    entry_port     = 80
    entry_protocol = "http"

    target_port     = 80
    target_protocol = "http"
  }

  healthcheck {
    port     = 80
    path     = "/"
    protocol = "http"
  }

  droplet_ids = [digitalocean_droplet.app_node_1.id, digitalocean_droplet.app_node_2.id]
}
 