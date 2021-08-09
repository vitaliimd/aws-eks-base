data "template_file" "nginx_ingress" {
  template = file("${path.module}/templates/${local.template_name}")

  vars = {
    hostname           = var.domain_name
    ssl_cert           = local.ssl_certificate_arn
    proxy_real_ip_cidr = var.vpc_cidr
    namespace          = var.namespace
  }
}
resource "helm_release" "nginx_ingress" {
  name        = var.name
  chart       = var.chart_name
  repository  = var.repository
  namespace   = var.namespace
  version     = var.nginx_ingress_controller_version
  wait        = false
  max_history = var.helm_release_history_size

  values = [
    data.template_file.nginx_ingress.rendered,
  ]

  depends_on = [helm_release.prometheus_operator]
}
