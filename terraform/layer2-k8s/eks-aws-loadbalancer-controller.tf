module "eks_alb_ingress" {
  source = "../modules/eks-aws-loadbalancer-controller"
  count  = var.aws_loadbalancer_controller_enable ? 1 : 0

  name                         = local.name
  region                       = local.region
  helm_release_history_size    = local.helm_release_history_size
  domain_name                  = local.domain_name
  vpc_id                       = local.vpc_id
  namespace                    = module.ing_namespace.name
  vpc_cidr                     = local.vpc_cidr
  nginx_ingress_ssl_terminator = "lb"
}
