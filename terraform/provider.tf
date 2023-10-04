terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }

    cloudns = {
    	source = "SharkyRawr/cloudns"
      version = "~> 0.0.7"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

provider "cloudns" {
	auth_id = var.cloudns_auth_id

	password = var.cloudns_password  
}
