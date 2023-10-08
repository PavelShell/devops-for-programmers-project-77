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

variable "datadog_app_token" {
  description = "Datadog app token"
  type        = string
  sensitive = true
}
