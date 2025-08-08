variable "project_id" {
  description = "The ID of the Public Cloud project the resources will be created in."
  type        = string
}

variable "cluster_id" {
  description = "ID of the cluster for the nodepool."
  type        = string
}

variable "name" {
  description = "Name to give the nodepool."
  type        = string
}

variable "flavor_name" {
  description = "The type of nodes to use for this nodepool."
  type        = string
}

variable "nodes" {
  description = "Number of nodes in this nodepool."
  type        = number
}

variable "min_nodes" {
  description = "Maximum number of nodes this nodepool can have."
  type        = number
  default     = 0
}

variable "max_nodes" {
  description = "Minimum number of nodes this nodepool can have."
  type        = number
  default     = 0
}

variable "availability_zones" {
  description = "Availability zones to create the nodes in (for multi-AZ clusters)."
  type        = list(string)
  default     = []
}

variable "monthly_billed" {
  description = "Should the nodes be billed on a monthly basis."
  type        = bool
  default     = false
}

variable "template" {
  description = "Nodepool template for applying metadata."
  type = object({
    annotations   = optional(map(any), {})
    labels        = optional(map(any), {})
    finalizers    = optional(list(string), [])
    unschedulable = optional(bool, false)
    taints = optional(list(object({
      effect = string
      key    = string
      value  = string
    })), [])
  })
  default = null
}
