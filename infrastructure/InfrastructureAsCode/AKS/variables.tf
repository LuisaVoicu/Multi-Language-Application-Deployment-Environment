variable "kubernetes_cluster_location" {
  type        = string
  default     = "westeurope"
  description = "Location of the Kubernetes cluster."
}

variable "kubernetes_cluster_location_prefix" {
  type        = string
  default     = "weu"
  description = "Location of the Kubernetes cluster."
}

variable "kubernetes_cluster_stage_prefix" {
  type        = string
  default     = "d"
  description = "Stage prefix of the Kubernetes cluster."
}


variable "kubernetes_cluster_name_prefix" {
  type        = string
  description = "Prefix of the Kubernetes cluster name that's combined with a random value so name is unique in your Azure subscription."
  default     = "aks"
}

variable "owner_name" {
  type        = string
  default     = "vol1"
  description = "Prefix of the Kubernetes cluster name that's combined with a random ID so name is unique in your Azure subscription."
}
