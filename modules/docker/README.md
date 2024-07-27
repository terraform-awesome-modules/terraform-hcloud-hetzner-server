# Docker - Hcloud Server Terraform Module

Deploys docker inside of a Hcloud server

## Usage

``` terraform
module docker {
    
     source  = "terraform-awesome-modules/hetzner-server/hcloud//modules/docker"
     version = "~>0.1.2"

    server_name = ["test1"]
    server_type = ["cx22"]
    location    = ["fsn1"]
    network = {

        public_net = {
            ipv4_enabled = true
            ipv6_enabled = false
        }
     
    }
}

output "docker_server_ipv4_addresses" {
  value = module.docker.server_ipv4_addresses
}

output "docker_server_ipv6_addresses" {
  value = module.docker.server_ipv6_addresses
}
```

All automatic values for docker module is using are available here.

## Requirements

## Providers

## Modules

## Resources

## Inputs