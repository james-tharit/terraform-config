terraform {
  # Providers can be founded in Terraform Registry: https://registry.terraform.io
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_network" "web_server_network" {
  name       = "web_server"
  driver     = "bridge"
  attachable = true
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = var.container_name

  networks_advanced {
    name = "web_server"
  }

  ports {
    internal = 80
    external = 8080
  }
}
