resource "kubernetes_deployment" "mongo" {
  metadata {
    name = "mongo"
    namespace = var.kubernetes_namespace

    labels = {
      name = "mongo"
    }
  }

  spec {
    replicas = 1 # 1 Node

    selector {
      match_labels = {
        name = "mongo"
      }
    }

    template {
      metadata {
        labels = {
          name = "mongo"
        }
      }

      spec {
        volume {
          name = "mongo-db"

          persistent_volume_claim {
            claim_name = "mongo-storage" # mongo-pvc.tf
          }
        }

        container {
          name  = "mongo"
          image = "mongo"

          port {
            name           = "mongo"
            container_port = 27017 # Connection port for MongoDB
          }

          volume_mount {
            name       = "mongo-db"
            mount_path = "/mnt/data/db"
          }
        }
      }
    }
  }
}

