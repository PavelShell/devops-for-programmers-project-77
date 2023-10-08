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

resource "digitalocean_domain" "sagser" {
  name = "dnstest.sagser.cloudns.ph"
}

resource "digitalocean_record" "www" {
  domain = digitalocean_domain.sagser.id
  type   = "A"
  name   = "@"
  value  = digitalocean_loadbalancer.load_balancer.ip
}

resource "datadog_monitor_json" "monitor_json" {
  monitor = <<-EOF
{
	"name": "КАРАУЛ, ПРОД УПАЛ!!",
	"type": "service check",
	"query": "\"tcp.can_connect\".over(\"instance:healthcheck\").by(\"*\").last(2).count_by_status()",
	"message": "КАРАУЛ, ПРОД УПАЛ!!",
	"tags": [],
	"options": {
		"thresholds": {
			"critical": 1,
			"warning": 1,
			"ok": 1
		},
		"notify_audit": false,
		"notify_no_data": true,
		"no_data_timeframe": 2,
		"renotify_interval": 0,
		"timeout_h": 0,
		"include_tags": false,
		"new_host_delay": 300,
		"silenced": {}
	},
	"priority": null,
	"restricted_roles": null
}
EOF

	depends_on = [digitalocean_loadbalancer.load_balancer]
}
