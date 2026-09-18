variable "project_name" {
  type        = string
  description = "Project / cluster name."
}

variable "region" {
  type        = string
  description = "Name of the region the resources will be delivered to."
}

variable "k8s_version" {
  type        = string
  description = "Kubernetes version used by the project."
}

variable "ssm_vpc" {
  type        = string
  description = "SSM parameter holding the ID of the VPC the project will be created in."
}

variable "ssm_public_subnets" {
  type        = list(string)
  description = "List of SSM parameters holding the project's public subnet IDs."
}

variable "ssm_private_subnets" {
  type        = list(string)
  description = "List of SSM parameters holding the project's private subnet IDs."
}

variable "ssm_pod_subnets" {
  type        = list(string)
  description = "List of SSM parameters holding the project's pod subnet IDs."
}

variable "auto_scale_options" {
  type = object({
    min     = number
    max     = number
    desired = number
  })
  description = "Cluster autoscaling settings."
}

variable "nodes_instance_sizes" {
  type        = list(string)
  description = "List of instance sizes used by the project."
}

variable "addon_cni_version" {
  type        = string
  default     = "v1.18.3-eksbuild.2"
  description = "VPC CNI addon version."
}

variable "addon_coredns_version" {
  type        = string
  default     = "v1.11.3-eksbuild.1"
  description = "CoreDNS addon version."
}

variable "addon_kubeproxy_version" {
  type        = string
  default     = "v1.31.2-eksbuild.3"
  description = "Kube-proxy addon version."
}

variable "karpenter_capacity" {
  type = list(object({
    name               = string
    workload           = string
    ami_family         = string
    ami_ssm            = string
    instance_family    = list(string)
    instance_sizes     = list(string)
    capacity_type      = list(string)
    availability_zones = list(string)
  }))
}

variable "dns_name" {
  type    = string
  default = "*.example.com"
}

variable "route53_hosted_zone" {
  type    = string
  default = "Z102505525LUE9SZ7HWTY"
}

# Nginx

variable "nginx_min_replicas" {
  type        = string
  default     = "3"
}

variable "nginx_max_replicas" {
  type        = string
  default     = "60"
}

variable "nginx_requests_cpu" {
  type        = string
  default     = "250m"
}

variable "nginx_requests_memory" {
  type        = string
  default     = "512Mi"
}

variable "nginx_limits_cpu" {
  type        = string
  default     = "500m"
}

variable "nginx_limits_memory" {
  type        = string
  default     = "1024Mi"
}