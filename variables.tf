variable "server_name" {
    description = "list of server names."
    type       = list(string)
}

variable "image" {
    description = "list of os images for each server."
    type       = list(string)
}

variable "server_type" {
    description = "list of server types corresponding to each server name."
    type       = list(string)
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

variable "network" {
  type = object({
    public_net = object({
      ipv4_enabled = bool
      ipv6_enabled = bool
    })
    private_net = list(object({
      network_id = string
      ip         = string
    }))
  })
  default = {
    public_net = {
      ipv4_enabled = true
      ipv6_enabled = false
    }
    private_net = []
  }
  description = "networking configuration for the Hetzner cloud server."
}

variable "firewall_ids" {
  type = list(number)
  default = []
  description = "Firewall IDs the server should be attached to on creation."
}

variable "backups" {
  type        = bool
  default     = false
  description = "Whether to enable backups for the server."
}

variable "user_data" {
  type        = string
  default     = "" 
  description = "Path to a cloud-init user data file. Leave empty if not used."
}

variable "volumes" {
  type = map(object({
    size        = number       // Volume size in GB
    name        = string       // Suffix to append to server name for volume naming
    format      = string       // File system format
    automount   = bool         // Whether to automount the volume
  }))
  default = {}
  description = "List of volume configurations to attach to each server."
}
