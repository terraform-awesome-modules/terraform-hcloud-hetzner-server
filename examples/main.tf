module "hcloud_server" {
  source  = "terraform-awesome-modules/hetzner-server/hcloud"
  version = "0.1.1"

  server_name = ["hcloud_server"]
  server_type = ["cx22"]
  image       = ["ubuntu-24.04"]
  location    = ["fsn1"]
  network     = {
    public_net = {
      ipv4_enabled = true
      ipv6_enabled = false
    }
    private_net = []
    firewall_ids = []
  }

  ssh_keys = [""]
  user_data   = ""
}

output "server_ipv4_addresses" {
  value = module.hcloud_server.server_ipv4_addresses
}

output "server_ipv6_addresses" {
  value = module.hcloud_server.server_ipv6_addresses
}