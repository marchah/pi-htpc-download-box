resource "helm_release" "plex_server" {
  name       = "${var.namespace}-plex-server"
  chart      = "plex-server"
  repository = "${path.module}/charts"
  namespace  = var.namespace
  wait       = true

  lifecycle {
    create_before_destroy = true
  }

  values = [
    templatefile("${path.module}/charts/plex-server/values.yaml", {
      timezone = var.timezone,
      namespace = var.namespace,
      configPath = var.configPath,
      dataPath = var.dataPath,
      PUID = var.PUID,
      PGID = var.PGID,
    })
  ]
}