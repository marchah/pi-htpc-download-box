resource "kubernetes_pod" "bazarr" {
    metadata {
    name      = "bazarr"
    //namespace = kubernetes_namespace.htpc_namespace.metadata.0.name
  }

  spec {
    container {
      image = "linuxserver/bazarr:latest"
      name  = "bazarr"
      port {
        container_port = 6767
      }

      env {
        name = "PUID"
        value = var.PUID
      }

      env {
        name = "PGID"
        value = var.PGID
      }

      env {
        name = "TZ"
        value = var.TZ
      }

      volume_mount {
        mount_path = "/config"
        name = "config"
      }

      volume_mount {
        mount_path = "/data/tvshows"
        name = "tvshows"
      }

      volume_mount {
        mount_path = "/data/movies"
        name = "movies"
      }
    }
    volume {
      name = "config"
      host_path {
        path = "${var.CONFIG}/config/bazarr"
      }
    }
    volume {
      name = "tvshows"
      host_path {
        path = "${var.ROOT}/tv"
      }
    }
    volume {
      name = "movies"
      host_path {
        path = "${var.ROOT}/movies"
      }
    }
  }
}

resource "kubernetes_service" "bazarr" {
  metadata {
    name      = "bazarr"
    //namespace = kubernetes_namespace.htpc_namespace.metadata.0.name
  }
  spec {
    selector = {
      app = kubernetes_pod.bazarr.metadata.0.name
    }
    type = "NodePort"
    port {
      node_port   = 30202
      port        = 6767
      target_port = 6767
    }
  }
}