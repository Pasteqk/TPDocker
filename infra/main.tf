# Spécification de la version du provider Terraform pour Docker
terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "2.13.0" # Remplacez par la version souhaitée du provider Docker
    }
  }
}

# Configuration du provider Docker avec un hôte local
provider "docker" {
  host = "unix:///var/run/docker.sock" # Spécifiez le chemin correct vers le socket Docker si nécessaire
}

# Déclaration de la ressource docker_image "build"
resource "docker_image" "build" {
  name         = "my_custom_image" # Remplacez par le nom de l'image souhaité
  build {
    context    = "${path.module}/tpDevops/tp2/TPDocker/Dockerfile" # Remplacez le chemin vers votre Dockerfile
    dockerfile = "${path.module}/tpDevops/tp2/TPDocker/Dockerfile" # Remplacez le chemin vers votre Dockerfile
  }
}

# Déclaration de la ressource docker_container "container"
resource "docker_container" "container" {
  name  = "myContainer"
  image = docker_image.build.name # Utilisez l'image précédemment construite

  # Autres configurations du conteneur (ports, variables d'environnement, etc.) peuvent être ajoutées ici.
}
