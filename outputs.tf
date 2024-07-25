output "vm_names" {
  value = hcloud_server.server.*.name
  description = "VM names"
}


output "server_ipv4_addresses" {
  value = hcloud_server.server.*.ipv4_address
  description = "Map of server names to their respective IPv4 addresses."
}

output "server_ipv6_addresses" {
  value = hcloud_server.server.*.ipv6_address
  description = "Map of server names to their respective IPv6 addresses."
}
