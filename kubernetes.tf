terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_namespace" "new_flaskapp" {
  metadata {
    annotations = {
      name = "new_flaskapp"
    }

    labels = {
      mylabel = "new_flaskapp"
    }

    name = "new_flaskapp"
  }
}

resource "kubernetes_deployment" "new_flaskapp" {
  metadata {
    name = "new_flaskapp"
    labels = {
      App = "new_flaskapp"
    }
  }

  spec {
    replicas = 3
    selector {
      match_labels = {
        App = "new_flaskapp"
      }
    }
    template {
      metadata {
        labels = {
          App = "new_flaskapp"
        }
      }
      spec {
        container {
          image = "ssrful/new_flaskapp"
          name  = "new_flaskapp"

          port {
            container_port = 5000
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
  # deployment shouldn't take longer than a few minutes normally
  timeouts {
    create = "1m"
    update = "1m"
    delete = "2m"
  }
}

resource "kubernetes_service" "new_flaskapp" {
  metadata {
    name = "new_flaskapp"
  }
  spec {
    selector = {
      App = kubernetes_deployment.new_flaskapp.spec.0.template.0.metadata[0].labels.App
    }
    port {
      node_port   = 35000
      port        = 5000
      target_port = 5000
    }

    type = "NodePort"
  }
}

