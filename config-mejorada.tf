La configuración propuesta usando mapas por entorno es una buena base para trabajar con Terraform, Docker y herramientas como Grafana, pero necesita ajustes para ser realmente robusta y segura en un entorno real. Es importante estructurar las variables por entorno (dev, qa, prod) de forma consistente, evitando poner credenciales en texto plano. Se recomienda usar archivos .tfvars para Terraform y .env para Docker, manteniendo separadas las configuraciones por ambiente. Además, es fundamental declarar las variables sensibles como sensitive = true o, mejor aún, usar gestores de secretos como Vault o AWS Secrets Manager. En cuanto a los puertos, en producción se deben usar los estándar como el 80 o 443, y solo usar puertos alternativos como 81 si hay una justificación técnica. La estructura ideal separa claramente la infraestructura, los contenedores y las variables, permitiendo escalar fácilmente, mantener seguridad, y trabajar de forma ordenada en múltiples entornos

variable "env" {
  type    = string
  default = "dev"
}

variable "config" {
  type = map(any)
  default = {
    dev = {
      nginx_port = 3000
      web_port   = 5000
      pg_user    = "devuser"
      pg_pass    = "devpass"
      pg_db      = "devdb"
    }
    qa = {
      nginx_port = 4000
      web_port   = 5001
      pg_user    = "qauser"
      pg_pass    = "qapass"
      pg_db      = "qadb"
    }
    prod = {
      nginx_port = 80
      web_port   = 80
      pg_user    = "produser"
      pg_pass    = "prodpass"
      pg_db      = "proddb"
    }
  }
}
