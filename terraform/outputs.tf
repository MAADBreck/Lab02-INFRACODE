
output "grafana_url" {
  value = "http://localhost:${var.web_server_ports_external}"
}

output "app1_url" {
  value = "http://localhost:${var.web_server_ports_external + 1}"
}

output "app2_url" {
  value = "http://localhost:${var.web_server_ports_external + 2}"
}

output "app3_url" {
  value = "http://localhost:${var.web_server_ports_external + 3}"
}

output "nginx_url" {
  value = "http://localhost:${var.nginx_external_port[terraform.workspace]}"
}
