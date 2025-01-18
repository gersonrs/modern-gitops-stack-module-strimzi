locals {
  helm_values = [{
    strimzi-kafka-operator = {
      replicas = var.replicas
      resources = {
        requests = { for k, v in var.resources.general.requests : k => v if v != null }
        limits   = { for k, v in var.resources.general.limits : k => v if v != null }
      }
    }
  }]
}
