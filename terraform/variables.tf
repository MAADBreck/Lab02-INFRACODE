# Puertos externos para NGINX (http=80, https=443)
variable "nginx_external_port" {
  description = "Coloca el puerto de NGINX"
  type        = map(number)
}
# Puerto externo base para Grafana y apps
variable "web_server_ports_external" {
  description = "Puerto base externo para Grafana y apps"
  type        = number
}
# Credenciales y DB de PostgreSQL
variable "pg_user"     { type = string }
variable "pg_password" { type = string }
variable "pg_db"       { type = string }
