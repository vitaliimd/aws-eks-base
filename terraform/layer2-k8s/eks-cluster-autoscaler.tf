locals {
  service_monitor_enable = var.kube_prometheus_stack_enable ? module.kube_prometheus_stack : null
}

module "cluster_autoscaler" {
  source = "../modules/eks-cluster-autoscaler"
  count  = var.cluster_autoscaler_enable ? 1 : 0

  name                   = local.name
  region                 = local.region
  eks_cluster_id         = local.eks_cluster_id
  eks_oidc_provider_arn  = local.eks_oidc_provider_arn
  service_monitor_enable = local.service_monitor_enable
}
