terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.30"
    }

    datadog = {
    	source = "DataDog/datadog"
      version = "~> 3.30"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

provider "datadog" {
	api_key = var.datadog_token
	app_key = var.datadog_app_token
	api_url = "https://api.datadoghq.eu/"
}
