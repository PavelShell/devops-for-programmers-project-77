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

variable "golang_server_name" {
  type = string
  default	= "trinity7"
}
