module "ssh_firewall" {
  source  = "terraform-awesome-modules/hetzner-firewall/hcloud//modules/ssh"
  version = "~>0.1.9"

    source_ips = ["0.0.0.0/0"]
    firewall_rule_name = var.firewall_rule_name
    
}

module "hcloud_docker_server" {
  source  = "../../"

  server_name = var.server_name
  server_type = var.server_type
  image       = length(var.image) > 0 ? var.image : local.default_images
  location    = var.location
  ssh_keys = var.ssh_keys
  user_data   = "${abspath(path.module)}/cloud-init.yaml"
  firewall_ids = [module.ssh_firewall.firewall_ids]

  network     = {
    public_net = {
      ipv4_enabled = true
      ipv6_enabled = false
    }
    private_net = []
  }
}
