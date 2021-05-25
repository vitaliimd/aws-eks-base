variable "name" {
  description = "Project name, required to create unique resource names"
  type        = string
}

variable "region" {
  description = "Default infrastructure region"
  type        = string
}

variable "eks_oidc_provider_arn" {
  description = "ARN of EKS oidc provider"
  type        = string
}

variable "helm_repo_cluster_autoscaler" {
  description = "Repository name for kube-prometheus-stack"
  type        = string
  default     = "https://kubernetes.github.io/autoscaler"
}

variable "kubernetes_namespace" {
  description = "Name of kubernetes namespace for prometheus stack"
  type        = string
  default     = "sys"
}

variable "cluster_autoscaler_chart_version" {
  description = "Version of cluster autoscaler helm chart"
  type        = string
  default     = "9.9.2"
}

variable "helm_release_wait" {
  description = "Will wait until all resources are in a ready state before marking the release as successful. It will wait for as long as timeout. Defaults to true."
  type        = string
  default     = false
}

variable "helm_release_history_size" {
  description = "How much helm releases to store"
  type        = number
  default     = 5
}

variable "eks_cluster_id" {
  description = "EKS cluster ID"
  type        = string
}

variable "cluster_autoscaler_version" {
  description = "Version of cluster autoscaler"
  type        = string
  default     = "v1.19.0"
}

variable "service_monitor_enable" {
  description = "Depends on kube-prometheus-stack"
  default     = null
}



