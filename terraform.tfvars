env = "dev"

config = {
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
