
output "grafana_url" {
  value = "http://localhost:${var.web_server_ports_external}"  # URL base de Grafana
}

output "app1_url" {
  value = "http://localhost:${var.web_server_ports_external + 1}"  # URL App1 (+1 al puerto base)
}

output "app2_url" {
  value = "http://localhost:${var.web_server_ports_external + 2}"  # URL App2 (+2 al puerto base)
}

output "app3_url" {
  value = "http://localhost:${var.web_server_ports_external + 3}"  # URL App3 (+3 al puerto base)
}

output "nginx_url" {
  value = "http://localhost:${var.nginx_external_port[terraform.workspace]}"  # URL Nginx según workspace
}
