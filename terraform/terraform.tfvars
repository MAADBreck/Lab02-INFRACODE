# Puertos de NGINX según entorno
nginx_external_port = {
  dev  = 3000
  qa   = 4000
  prod = 81
}
# Puerto externo base para Grafana y apps
web_server_ports_external = 5000 
# Credenciales de PostgreSQL (entorno de desarrollo)
pg_user     = "devuser"
pg_password = "devpass"
pg_db       = "devdb"
