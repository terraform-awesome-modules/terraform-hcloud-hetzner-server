output "vm_names" {
  value = module.hcloud_docker_server.vm_names
}

output "server_ipv4_addresses" {
  value = module.hcloud_docker_server.server_ipv4_addresses
}

output "server_ipv6_addresses" {
  value = module.hcloud_docker_server.server_ipv6_addresses
}