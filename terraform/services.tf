# Imágenes locales de las apps (app1, app2, app3)
resource "docker_image" "app1" {
  name = "app1-${terraform.workspace}"
  build {
    context    = "${local.apps_root}/app1"
    dockerfile = "Dockerfile"
  }
}

resource "docker_image" "app2" {
  name = "app2-${terraform.workspace}"
  build {
    context    = "${local.apps_root}/app2"
    dockerfile = "Dockerfile"
  }
}

resource "docker_image" "app3" {
  name = "app3-${terraform.workspace}"
  build {
    context    = "${local.apps_root}/app3"
    dockerfile = "Dockerfile"
  }
}

# Redis y Postgres (persistence_net)

# Redis
resource "docker_container" "redis" {
  name  = "redis-${terraform.workspace}"
  image = "redis:bookworm"
  mounts {
    target = "/data"
    source = docker_volume.redis_data.name
    type   = "volume"
  }

  networks_advanced { name = docker_network.persistence_net.name }
}

# Postgres
resource "docker_container" "postgres" {
  name  = "postgres-${terraform.workspace}"
  image = "postgres:bookworm"

  env = [
    "POSTGRES_USER=${var.pg_user}",
    "POSTGRES_PASSWORD=${var.pg_password}",
    "POSTGRES_DB=${var.pg_db}",
  ]

  mounts {
    target = "/var/lib/postgresql/data"
    source = docker_volume.pg_data.name
    type   = "volume"
  }

  networks_advanced { name = docker_network.persistence_net.name }
}

# Apps Node 

locals {
  app_common_env = [
    "PORT=3000",
    "HOST=0.0.0.0",
    "REDIS_URL=redis://redis-${terraform.workspace}:6379",
    "PGHOST=postgres-${terraform.workspace}",
    "PGUSER=${var.pg_user}",
    "PGPASSWORD=${var.pg_password}",
    "PGDATABASE=${var.pg_db}",
    "PGPORT=5432",
  ]
}

# app1 
resource "docker_container" "app1" {
  name  = "app1-${terraform.workspace}"
  image = docker_image.app1.name
  env   = local.app_common_env

  ports {
    internal = 3000
    external = var.web_server_ports_external + 1
  }

  networks_advanced { name = docker_network.app_net.name }
  networks_advanced { name = docker_network.persistence_net.name }

  depends_on = [docker_container.redis, docker_container.postgres]
}

# app2
resource "docker_container" "app2" {
  name  = "app2-${terraform.workspace}"
  image = docker_image.app2.name
  env   = local.app_common_env

  ports {
    internal = 3000
    external = var.web_server_ports_external + 2
  }

  networks_advanced { name = docker_network.app_net.name }
  networks_advanced { name = docker_network.persistence_net.name }

  depends_on = [docker_container.redis, docker_container.postgres]
}

# app3
resource "docker_container" "app3" {
  name  = "app3-${terraform.workspace}"
  image = docker_image.app3.name
  env   = local.app_common_env

  ports {
    internal = 3000
    external = var.web_server_ports_external + 3
  }

  networks_advanced { name = docker_network.app_net.name }
  networks_advanced { name = docker_network.persistence_net.name }

  depends_on = [docker_container.redis, docker_container.postgres]
}

# ==== Grafana  ====
resource "docker_container" "grafana" {
  name  = "grafana-${terraform.workspace}"
  image = "grafana/grafana-oss:11.2.0"

  ports {
    internal = 3000
    external = var.web_server_ports_external
  }

  networks_advanced { name = docker_network.monitor_net.name }
  networks_advanced { name = docker_network.app_net.name }
}
