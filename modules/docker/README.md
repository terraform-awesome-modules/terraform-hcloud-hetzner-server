# http-80 - Hcloud Firewall Terraform Module

Allows inbound http (80) connections for a server on given Hcloud.

## Usage

``` terraform
module "https" {
  source  = "terraform-awesome-modules/hetzner-firewall/hcloud//modules/http-80"
  version = "~>0.1.4"

    source_ips = ["0.0.0.0/0"]
}

```

All automatic values for http-80 module is using are available here.

## Requirements

## Providers

## Modules

## Resources

## Inputs