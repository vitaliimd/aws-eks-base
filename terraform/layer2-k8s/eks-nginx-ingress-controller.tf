module "eks-nginx-ingress-controller" {
  source = "../modules/eks-nginx-ingress-controller"
  count  = var.eks-nginx-ingress-controller_enable ? 1 : 0

  name                         = local.name
  region                       = local.region
  helm_release_history_size    = local.helm_release_history_size
  domain_name                  = local.domain_name
  vpc_id                       = local.vpc_id
  namespace                    = module.ing_namespace.name
  vpc_cidr                     = local.vpc_cidr
  nginx_ingress_ssl_terminator = "lb"
  # options:
  # lb - terminate ssl on loadbalancer side
  # nginx - terminate ssl on nginx side
}
