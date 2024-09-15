variable "container_registry_location" {
  type        = string
  default     = "westeurope"
  description = "Location of the container registry."
}

variable "container_registry_location_prefix" {
  type        = string
  default     = "weu"
  description = "Location of the container registry."
}

variable "container_registry_stage_prefix" {
  type        = string
  default     = "d"
  description = "Stage prefix of the container registry."
}


variable "container_registry_name_prefix" {
  type        = string
  description = "Prefix of the container registry name that's combined with a random value so name is unique in your Azure subscription."
  default     = "acr"
}

variable "owner_name" {
  type        = string
  default     = "vol1"
  description = "Prefix of the container registry name that's combined with a random ID so name is unique in your Azure subscription."
}
