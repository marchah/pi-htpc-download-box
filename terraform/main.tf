# Install terraform
# install minikibe
# `minikube start`

provider "kubernetes" {
  config_context_cluster   = "minikube"
}

resource "kubernetes_namespace" "htpc_namespace" {
  metadata {
    name = "htpc-namespace"
  }
}

/*resource "docker_service" "plex-service" {
  name = "plex-server"

  task_spec {
    container_spec {
      image = "linuxserver/plex:latest"

      env = {
        PUID    = var.PUID
        PGID    = var.PGID
        TZ      = var.TZ
        VERSION = "docker"
      }

      mounts {
        target = "/config"
        source = "${var.CONFIG}/config/plex/db"
        type   = "volume"
      }

      mounts {
        target = "/transcode"
        source = "${var.CONFIG}/config/plex/transcode"
        type   = "volume"
      }

      mounts {
        target = "/data/tvshows"
        source = "${var.ROOT}/tv"
        type   = "volume"
      }

      mounts {
        target = "/data/movies"
        source = "${var.ROOT}/movies"
        type   = "volume"
      }
    }
  }
}
*/
    
resource "kubernetes_pod" "plex_server" {
  metadata {
    name = "plex-server"
  }

  spec {
    container {
      image = "linuxserver/plex:latest"
      name  = "plex-server"

      env {
        name  = "PUID"
        value = var.PUID
      }

      env {
        name  = "PGID"
        value = var.PGID
      }

      env {
        name  = "TZ"
        value = var.TZ
      }

      env {
        name  = "VERSION"
        value = "docker"
      }

      /*liveness_probe {
        http_get {
          path = "/"
          port = 80

          http_header {
            name  = "X-Custom-Header"
            value = "Awesome"
          }
        }

        initial_delay_seconds = 3
        period_seconds        = 3
      }*/

      volume_mount {
        name = "/config"
        mount_path = "${var.CONFIG}/config/plex/db"
      }

      volume_mount {
        name = "/transcode"
        mount_path = "${var.CONFIG}/config/plex/transcode"
      }

      volume_mount {
        name = "/data/tvshows"
        mount_path = "${var.ROOT}/tv"
      }

      volume_mount {
        name = "/data/movies"
        mount_path = "${var.ROOT}/movies"
      }
    }

    /*dns_config {
      nameservers = ["1.1.1.1", "8.8.8.8", "9.9.9.9"]
      searches    = ["example.com"]

      option {
        name  = "ndots"
        value = 1
      }

      option {
        name = "use-vc"
      }
    }

    dns_policy = "None"*/
  }
}