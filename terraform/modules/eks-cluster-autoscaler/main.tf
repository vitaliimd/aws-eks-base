locals {
  service_monitor_enable = var.service_monitor_enable != null ? true : false
  cluster_autoscaler_template = templatefile("${path.module}/templates/cluster-autoscaler-values.yaml",
    {
      role_arn               = module.aws_iam_autoscaler.role_arn
      region                 = var.region
      cluster_name           = var.eks_cluster_id
      version                = var.cluster_autoscaler_version
      service_monitor_enable = local.service_monitor_enable
  })
}

module "aws_iam_autoscaler" {
  source = "../aws-iam-autoscaler"

  name              = var.name
  region            = var.region
  oidc_provider_arn = var.eks_oidc_provider_arn
  eks_cluster_id    = var.eks_cluster_id
}

resource "helm_release" "cluster_autoscaler" {
  name        = "cluster-autoscaler"
  chart       = "cluster-autoscaler"
  repository  = var.helm_repo_cluster_autoscaler
  version     = var.cluster_autoscaler_chart_version
  namespace   = var.kubernetes_namespace
  max_history = var.helm_release_history_size

  values = [
    local.cluster_autoscaler_template
  ]

  depends_on = [var.service_monitor_enable]
}
