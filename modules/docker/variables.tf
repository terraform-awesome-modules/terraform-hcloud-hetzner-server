variable "server_name" {
    description = "list of server names."
    type       = list(string)
}

variable "server_type" {
    description = "list of server types corresponding to each server name."
    type       = list(string)
}

variable "image" {
  description = "Base operating system for the docker server(s)."
  type        = list(string)
  default     = []
}

variable "ssh_keys" {
    description = "list of SSH key names to include on the server for authentication. an email with root password will be sent if not defined"
    type = list(string)
    default = []
}

variable "location" {
    description = "list of datacenter locations for each server."
    type       = list(string)
}

variable "backups" {
  type        = bool
  default     = false
  description = "Whether to enable backups for the server."
}

variable "private_net" {
  type = list(string)
  default = []
  description = "value"
}

variable "ipv4_enabled" {
  type = bool
  default = true
  description = "value"
}

variable "ipv6_enabled" {
  type = bool
  default = false
  description = "value"
}
