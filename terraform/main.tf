resource "docker_service" "plex-service" {
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

    