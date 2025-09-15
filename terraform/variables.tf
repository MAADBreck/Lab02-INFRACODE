
variable "nginx_external_port" {
  description = "Coloca el puerto de NGINX"
  type        = map(number)
}

variable "web_server_ports_external" {
  description = "Puerto base externo para Grafana y apps"
  type        = number
}

variable "pg_user"     { type = string }
variable "pg_password" { type = string }
variable "pg_db"       { type = string }
