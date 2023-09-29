terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Pulls the image
resource "docker_image" "build" {
  name = "build"
  build{
    context = ".."
  }
}

# Create a container
resource "docker_container" "container" {
  image = docker_image.build.image_id
  name  = "container"

  ports{
    internal = "80"
    external = "8080"
  }
}