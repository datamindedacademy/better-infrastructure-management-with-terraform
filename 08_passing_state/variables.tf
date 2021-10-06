variable "username" {
  description = "Username in the postgres database"
  type        = string
  sensitive   = true
  default     = "username"
}

variable "password" {
  description = "Password to the postgres database"
  type        = string
  sensitive   = true
  default     = "password"
}

variable "server_port" {
  description = "Port at which our server is listening"
  type        = string
  default     = 8080
}
