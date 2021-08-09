locals {
  ssl_certificate_arn = var.nginx_ingress_ssl_terminator == "lb" ? data.terraform_remote_state.layer1-aws.outputs.ssl_certificate_arn : ""

  template_name = (
    var.nginx_ingress_ssl_terminator == "lb" ? "nginx-ingress-values.yaml" : (
    var.nginx_ingress_ssl_terminator == "nginx" ? "nginx-ingress-certmanager-ssl-termination-values.yaml" : "")
  )
}
