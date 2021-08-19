variable "instance_type" {
  type        = string
  description = "type of the instance"
  default     = "ml.t2.medium"
}

variable "notebook_name" {
  type        = string
  description = "name of the notebook instance"
}

variable "ip_address" {
  type        = string
  description = "ip address to which ingress traffic is limited"
}