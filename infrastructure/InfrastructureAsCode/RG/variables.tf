variable "resource_group_location" {
  type        = string
  default     = "westeurope"
  description = "Location of the resource group."
}

variable "resource_group_location_prefix" {
  type        = string
  default     = "weu"
  description = "Location prefix of the resource group."
}

variable "resource_group_stage_prefix" {
  type        = string
  default     = "d"
  description = "Stage prefix of the resource group."
}

variable "resource_group_name_prefix" {
  type        = string
  default     = "rg"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "owner_name" {
  type        = string
  default     = "vol1"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}
