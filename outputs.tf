output "server_ipv4_addresses" {
  value = [for s in hcloud_server.server : s.ipv4_address if s.ipv4_address != null]
  description = "List of IPv4 addresses of the servers."
}

output "server_ipv6_addresses" {
  value = [for s in hcloud_server.server : s.ipv6_address if s.ipv6_address != null]
  description = "List of IPv6 addresses of the servers."
}