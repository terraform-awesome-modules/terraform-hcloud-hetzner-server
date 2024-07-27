variable "firewall_rule_name" {
    type = string
    default = "docker-ssh"
    description = "enable inbound ssh connections for the docker server(s)"
  
}

locals {
  default_images = length(var.server_name) > 0 ? [for _ in var.server_name : "ubuntu-24.04"] : []
}

variable "network" {
  
}