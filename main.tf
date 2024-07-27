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

  # Attach Firewall rules if specified
  firewall_ids = var.firewall_ids

  # Include SSH keys if specified
  ssh_keys = var.ssh_keys

  # Use user data from the specified file
  user_data   = var.user_data != "" ? file(var.user_data) : null
}

locals {
  server_index_map = { for idx in range(length(var.server_name)) : var.server_name[idx] => idx }

  server_volume_combinations = merge([
    for idx in range(length(var.server_name)) : {
      for v_key, v_val in var.volumes :
        "${var.server_name[idx]}-${v_key}" => {
          server_name = var.server_name[idx],
          volume_name = v_key,
          size        = v_val.size,
          name        = "${var.server_name[idx]}-${v_val.name}",
          format      = v_val.format,
          automount   = v_val.automount,
          location    = var.location[idx]  // Ensure idx is within bounds of var.location
        }
    }
  ]...)
}


# Create Volumes if specified
resource "hcloud_volume" "server_volume" {
  for_each = local.server_volume_combinations

  size      = each.value.size
  name      = "volume-${each.key}-${each.value.name}"
  format    = each.value.format
  automount = each.value.automount
  server_id = hcloud_server.server[local.server_index_map[each.value.server_name]].id
}

