
resource "docker_container" "nginx" {
  name  = "nginx-${terraform.workspace}" #Nombre dinámico según el workspace actual
  image = "nginx:stable-perl"  #Imagen oficial de Nginx (tag stable-perl)

  ports {
    internal = 80  #Puerto interno del contenedor
    external = var.nginx_external_port[terraform.workspace]  #Puerto externo definido por variable, por workspace
  }
}
