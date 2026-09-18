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

variable "addon_pod_identity_version" {
  type        = string
  default     = "v1.3.4-eksbuild.1"
  description = "Pod Identity addon version."
}

variable "addon_efs_csi_version" {
  type        = string
  default     = "v2.1.4-eksbuild.1"
  description = "EFS CSI addon version."

}

variable "grafana_host" {
  type        = string
  default     = "grafana.example.com"
  description = "Grafana host."
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

// Istio

variable "istio_version" {
  type        = string
  description = "Istio version."
  default     = "1.25.0"
}

variable "istio_min_replicas" {
  type        = string
  description = "Minimum number of replicas."
  default     = "3"
}



variable "istio_cpu_threshold" {
  type        = string
  description = "CPU threshold value."
  default     = "60"
}

// Jaeger

variable "jaeger_host" {
  type        = string
  description = "Jaeger host."
  default     = "jaeger.example.com"
}

// Kiali 

variable "kiali_host" {
  type        = string
  description = "Kiali host."
  default     = "kiali.example.com"
}

variable "kiali_version" {
  type        = string
  description = "Kiali version."
  default     = "2.5"
} 

// Keda

variable "keda_version" {
  type        = string
  description = "KEDA version."
  default     = "2.16.0"
  
}