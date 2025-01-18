locals {
  helm_values = [{
    strimzi-kafka-operator = {
      replicas = var.replicas
      resources = {
        requests = { for k, v in var.resources.controller.requests : k => v if v != null }
        limits   = { for k, v in var.resources.controller.limits : k => v if v != null }
      }
    }
  }]
}
