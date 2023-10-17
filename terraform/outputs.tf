output "DO1_ip" {
  description = "IP of the first server"
  value       = digitalocean_droplet.app_node_1.ipv4_address
}

output "DO2_ip" {
  description = "IP of the second server"
  value       = digitalocean_droplet.app_node_2.ipv4_address
}