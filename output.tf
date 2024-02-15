output "network_id" {
  description = "ID of docker network"
  value       = docker_network.web_server_network.id
}

output "container_id" {
  description = "ID of the Docker container"
  value       = docker_container.nginx.id
}

output "image_id" {
  description = "ID of the Docker image"
  value       = docker_image.nginx.id
}
