resource "hcloud_server" "server" {
  count       = length(var.server_name)
  name        = var.server_name[count.index]
  server_type = var.server_type[count.index]
  image       = var.image[count.index]
  location    = var.location[count.index]

  # Configure public network settings
  public_net {
    ipv4_enabled = var.network.public_net.ipv4_enabled
    ipv6_enabled = var.network.public_net.ipv6_enabled
  }

  # Dynamically configure private networks if provided
  dynamic "network" {
    for_each = var.network.private_net
    content {
      network_id = network.value.network_id
      ip         = network.value.ip
    }
  }

  # Include SSH keys if specified
  ssh_keys = var.ssh_keys

  # Use user data from the specified file
  user_data = var.user_data
}