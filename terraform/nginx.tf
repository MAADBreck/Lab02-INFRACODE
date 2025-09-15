
resource "docker_container" "nginx" {
  name  = "nginx-${terraform.workspace}"
  image = "nginx:stable-perl"

  ports {
    internal = 80
    external = var.nginx_external_port[terraform.workspace]
  }
}
