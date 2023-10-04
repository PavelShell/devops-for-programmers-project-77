variable "do_token" {
  description = "DigitalOcean API token"
  type        = string
  sensitive = true
}

variable "datadog_token" {
  description = "Datadog API token"
  type        = string
  sensitive = true
}

variable "cloudns_auth_id" {
  description = "ClouDNS platform authentication ID"
  type        = string
  sensitive = true
}

variable "cloudns_password" {
  description = "ClouDNS platform API password"
  type        = string
  sensitive = true
}
