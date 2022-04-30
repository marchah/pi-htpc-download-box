# install brew
# Install terraform
# install minikibe
# install k9s
# `minikube start`

provider "kubernetes" {
  #config_context_cluster   = "minikube"
  config_context = "minikube"
  config_path    = "~/.kube/config"
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
/*    
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
*/
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

      /*volume_mount {
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
      }*/
    //}

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
 // }
//}

resource "docker_image" "plex-server" {
    name = "linuxserver/plex"
}

resource "docker_container" "plex-server" {
    name = "plex-server"
    image = "${docker_image.plex-server.latest}"
    hostname = "plex"
    restart = "always"
    must_run = true
    network_mode = "host"
    /*ports = {
        internal = 32400
        external = 32400
    }
    env = [
        "X_PLEX_TOKEN=${var.plex_token}"
    ]
    ports = {
        internal = 32410
        external = 32410
        protocol = "udp"
    }
    ports = {
        internal = 32412
        external = 32412
        protocol = "udp"
    }
    ports = {
        internal = 32413
        external = 32413
        protocol = "udp"
    }
    ports = {
        internal = 32414
        external = 32414
        protocol = "udp"
    }
    volumes = {
        host_path = "/etc/localtime"
        container_path = "/etc/localtime"
        read_only = true
    }
    volumes = {
        host_path = "${var.plex_config_dir}"
        container_path = "/config"
    }
    volumes = {
        host_path = "${var.media_dir}"
        container_path = "/media"
    }
    depends_on = ["docker_container.sonarr", "docker_container.couchpotato"]*/
}