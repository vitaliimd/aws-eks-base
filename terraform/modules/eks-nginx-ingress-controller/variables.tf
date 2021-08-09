variable "name" {
  description = "Project name, required to create unique resource names"
  type        = string
  default     = "ingress-nginx"
}
variable "chart_name" {
  description = "Helm  Chart name"
  type        = string
  default     = "ingress-nginx"
}
variable "repository" {
  description = "Helm repo ingress nginx"
  default     = "https://kubernetes.github.io/ingress-nginx"
}
variable "namespace" {
  description = "Name of kubernetes namespace for alb_ingres"
  type        = string
  default     = ""
}
variable "nginx_ingress_controller_version" {
  description = "Version of nginx-ingress helm chart"
  default     = "3.23.0"
}
variable "helm_release_history_size" {
  description = "How much helm releases to store"
  default     = ""
}
variable "region" {
  description = "eks infrastructure region"
  type        = string
  default     = ""
}
variable "domain_name" {
  description = "domain_name"
  type        = string
  default     = ""
}
variable "vpc_cidr" {
  description = "EKS cluster vps identity"
  type        = string
  default     = ""
}
variable "nginx_ingress_ssl_terminator" {
  description = "Select SSL termination type"
  default     = ""
  # options:
  # lb - terminate ssl on loadbalancer side
  # nginx - terminate ssl on nginx side
}
