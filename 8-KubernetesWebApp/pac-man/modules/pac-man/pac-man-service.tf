resource "kubernetes_service" "pac-man" {
  metadata {
    name      = "pac-man"
    namespace = var.kubernetes_namespace

    labels = {
      name = "pac-man"
    }
  }

  spec {
    port {
      protocol    = "TCP"
      port        = 80
      target_port = "8080" # Running on 8080 in the container but serving to port 80
    }

    selector = {
      name = "pac-man"
    }

    type = "LoadBalancer"
  }
}

