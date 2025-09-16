# Terraform + Docker Infra

Infraestructura con **Terraform** y el provider `kreuzwerker/docker` que despliega:

- 3 apps Node.js conectadas a Redis y Postgres  
- Grafana para monitoreo  
- NGINX como servidor web  

## Requisitos
- Docker  
- Terraform  

## dev 

Grafana → http://localhost:5000
App1 → http://localhost:5001
App2 → http://localhost:5002
App3 → http://localhost:5003
NGINX → http://localhost:3000

##  Uso
```bash
terraform init
terraform workspace new dev   # primera vez
terraform workspace select dev
terraform apply -auto-approve
```
## Integrantes
Rodríguez Ruiz Alessandro Paul
Kristel Rivera Chamorro
Brad Barrios Capa  
Mc Brenk Ponce Vázques
Darli Manuel Medina Sixce
