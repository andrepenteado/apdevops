job "servicedesk" {
  datacenters = ["dc1"]

  group "servicedesk-group" {
    network {
      mode = "host"
      port "webapp" {
        to = "8080"
      }
    }

    task "web-server" {
      driver = "docker"

      config {
        image = "registry.gitlab.com/unespfc/sistemas/servicedesk:latest"
        ports = ["webapp"]

        # Criar rede no docker: docker network create rede_servicedesk
        network_mode = "rede_servicedesk"

        auth {
          username = "andrepenteado"
          password = "gh@Rp3rl"
        }
      }

      env {
        CATALINA_OPTS="-Dnashorn.args=--no-deprecation-warning -Duser.timezone=GMT-3 -Duser.language=pt -Duser.country=BR -Dfile.encoding=UTF-8"
        SPRING_PROFILES_ACTIVE="dev"
        URL_SISTEMA="localhost"
        SERVIDOR_EMAIL="localhost"
        DOMINIO_EMAIL="localdomain"
      }

      resources {
        cpu    = 2000
        memory = 1000
      }
    }

    task "db-server" {
      driver = "docker"

      config {
        image = "postgres"
        network_mode = "rede_servicedesk"
        network_aliases = ["db-server"]

        volumes = [
          "pgdata_servicedesk:/var/lib/postgresql/data"
        ]
      }

      env {
        POSTGRES_DB="servicedesk_v2"
        POSTGRES_USER="servicedesk_v2"
        POSTGRES_PASSWORD="iNgohl6L"
      }

      resources {
        cpu    = 2000
        memory = 512
      }
    }

  }
}
