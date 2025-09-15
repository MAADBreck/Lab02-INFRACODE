resource "docker_network" "app_net" {
  name = "app_net"
}

resource "docker_network" "persistence_net" {
  name = "persistence_net"
}

resource "docker_network" "monitor_net" {
  name = "monitor_net"
}

# Volúmenes para persistencia
resource "docker_volume" "pg_data" {
  name = "pg_data_${terraform.workspace}"
}

resource "docker_volume" "redis_data" {
  name = "redis_data_${terraform.workspace}"
}

# Rutas para las 3 apps
locals {
  apps_root = abspath("${path.module}/../apps")
}