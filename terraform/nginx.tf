resource "docker_container" "nginx" {
  name  = "nginx-${terraform.workspace}"
  image = "nginx:stable-perl"

  ports {
    internal = 80
    external = var.nginx_external_port[terraform.workspace]
  }

  volumes {
    host_path      = "/Users/dmedinasix/Lab02-INFRACODE/terraform/nginx.conf"
    container_path = "/etc/nginx/nginx.conf"
    read_only      = true
  }

  networks_advanced {
    name = docker_network.app_net.name
  }

  depends_on = [
    docker_container.app1,
    docker_container.app2,
    docker_container.app3
  ]
}
