resource "kubernetes_deployment" "pac-man" {
  metadata {
    name      = "pac-man"
    namespace = var.kubernetes_namespace

    labels = {
      name = "pac-man"
    }
  }

  spec {
    replicas = 1 # 1 Node

    selector {
      match_labels = {
        name = "pac-man"
      }
    }

    template {
      metadata {
        labels = {
          name = "pac-man"
        }
      }

      spec {
        container {
          name = "pac-man"
          #image = "quay.io/ifont/pacman-nodejs-app:latest"
          image = "docker.io/jessehoch/pacman-nodejs-app:latest" # Docker Hub image

          port {
            name           = "http-server"
            container_port = 8080 # Serving on 8080 in the container
          }
        }
      }
    }
  }
}

