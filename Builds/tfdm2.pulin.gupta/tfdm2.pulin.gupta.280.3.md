
## Build Details
<table>
<tr>
   <td><b>Build Reason</b></td>
   <td>BatchedCI</td>
</tr>
<tr>
   <td><b>Requestor</b></td>
   <td>TFLandingZone Build Service (victormorales0871)</td>
</tr>
<tr>
   <td><b>Repository</b></td>
   <td><a href=https://victormorales0871@dev.azure.com/victormorales0871/TFLandingZone/_git/tfdm2.pulin.gupta>https://victormorales0871@dev.azure.com/victormorales0871/TFLandingZone/_git/tfdm2.pulin.gupta</a></td>
</tr>
<tr>
   <td><b>Branch</b></td>
   <td>master</td>
</tr>
<tr>
   <td><b>Latest Commit</b></td>
   <td><a href=https://victormorales0871@dev.azure.com/victormorales0871/TFLandingZone/_git/tfdm2.pulin.gupta/commit/6bc3e49494aab1d941cc4cf236f1dca9ef9b5138>6bc3e49494aab1d941cc4cf236f1dca9ef9b5138</a></td>
</tr>
<tr>
   <td><b>Latest Commit Message</b></td>
   <td><pre>Build tfdm2.pulin.gupta.280.2</pre></td>
</tr>
</table>

## Terraform Show Output

``` sh

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.vnet.azurerm_network_security_group.nsg["app_subnet"] will be created
  + resource "azurerm_network_security_group" "nsg" {
      + id                  = (known after apply)
      + location            = "northeurope"
      + name                = "nsg_app_subnet_in"
      + resource_group_name = "tfdevopstest-rg"
      + security_rule       = [
          + {
              + access                                     = "Allow"
              + description                                = "Inbound_Port_443"
              + destination_address_prefix                 = "10.1.3.0/24"
              + destination_address_prefixes               = []
              + destination_application_security_group_ids = []
              + destination_port_range                     = "443"
              + destination_port_ranges                    = []
              + direction                                  = "Inbound"
              + name                                       = "weballow1"
              + priority                                   = 201
              + protocol                                   = "Tcp"
              + source_address_prefix                      = "AzureLoadBalancer"
              + source_address_prefixes                    = []
              + source_application_security_group_ids      = []
              + source_port_range                          = "*"
              + source_port_ranges                         = []
            },
          + {
              + access                                     = "Allow"
              + description                                = "Inbound_Port_80"
              + destination_address_prefix                 = "10.1.3.0/24"
              + destination_address_prefixes               = []
              + destination_application_security_group_ids = []
              + destination_port_range                     = "80"
              + destination_port_ranges                    = []
              + direction                                  = "Inbound"
              + name                                       = "weballow"
              + priority                                   = 200
              + protocol                                   = "Tcp"
              + source_address_prefix                      = "*"
              + source_address_prefixes                    = []
              + source_application_security_group_ids      = []
              + source_port_range                          = "*"
              + source_port_ranges                         = []
            },
          + {
              + access                                     = "Allow"
              + description                                = "Inbound_Port_9090"
              + destination_address_prefix                 = "10.1.3.0/24"
              + destination_address_prefixes               = []
              + destination_application_security_group_ids = []
              + destination_port_range                     = "9090"
              + destination_port_ranges                    = []
              + direction                                  = "Inbound"
              + name                                       = "weballow2"
              + priority                                   = 202
              + protocol                                   = "Tcp"
              + source_address_prefix                      = "VirtualNetwork"
              + source_address_prefixes                    = []
              + source_application_security_group_ids      = []
              + source_port_range                          = "*"
              + source_port_ranges                         = []
            },
        ]
      + tags                = {
          + "Environment" = "dev"
          + "Name"        = "app_subnet"
          + "Owner"       = "test-user"
          + "Terraform"   = "true"
        }
    }

  # module.vnet.azurerm_network_security_group.nsg["gw_subnet"] will be created
  + resource "azurerm_network_security_group" "nsg" {
      + id                  = (known after apply)
      + location            = "northeurope"
      + name                = "nsg_gw_subnet_in"
      + resource_group_name = "tfdevopstest-rg"
      + security_rule       = [
          + {
              + access                                     = "Allow"
              + description                                = "Inbound_Port_443"
              + destination_address_prefix                 = "10.1.2.0/24"
              + destination_address_prefixes               = []
              + destination_application_security_group_ids = []
              + destination_port_range                     = "443"
              + destination_port_ranges                    = []
              + direction                                  = "Inbound"
              + name                                       = "Default_Rule"
              + priority                                   = 101
              + protocol                                   = "Tcp"
              + source_address_prefix                      = "*"
              + source_address_prefixes                    = []
              + source_application_security_group_ids      = []
              + source_port_range                          = "*"
              + source_port_ranges                         = []
            },
          + {
              + access                                     = "Allow"
              + description                                = "Inbound_Port_80"
              + destination_address_prefix                 = "0.0.0.0/0"
              + destination_address_prefixes               = []
              + destination_application_security_group_ids = []
              + destination_port_range                     = "80"
              + destination_port_ranges                    = []
              + direction                                  = "Inbound"
              + name                                       = "weballow"
              + priority                                   = 100
              + protocol                                   = "Tcp"
              + source_address_prefix                      = "*"
              + source_address_prefixes                    = []
              + source_application_security_group_ids      = []
              + source_port_range                          = "*"
              + source_port_ranges                         = []
            },
          + {
              + access                                     = "Allow"
              + description                                = "Inbound_Port_8080-8090"
              + destination_address_prefix                 = "10.1.2.0/24"
              + destination_address_prefixes               = []
              + destination_application_security_group_ids = []
              + destination_port_range                     = "8080-8090"
              + destination_port_ranges                    = []
              + direction                                  = "Inbound"
              + name                                       = "weballow2"
              + priority                                   = 102
              + protocol                                   = "Tcp"
              + source_address_prefix                      = "*"
              + source_address_prefixes                    = []
              + source_application_security_group_ids      = []
              + source_port_range                          = "*"
              + source_port_ranges                         = []
            },
          + {
              + access                                     = "Allow"
              + description                                = "Outbound_Port_123"
              + destination_address_prefix                 = "0.0.0.0/0"
              + destination_address_prefixes               = []
              + destination_application_security_group_ids = []
              + destination_port_range                     = "123"
              + destination_port_ranges                    = []
              + direction                                  = "Outbound"
              + name                                       = "ntp_out"
              + priority                                   = 103
              + protocol                                   = "Udp"
              + source_address_prefix                      = "10.1.2.0/24"
              + source_address_prefixes                    = []
              + source_application_security_group_ids      = []
              + source_port_range                          = "*"
              + source_port_ranges                         = []
            },
        ]
      + tags                = {
          + "Environment" = "dev"
          + "Name"        = "gw_subnet"
          + "Owner"       = "test-user"
          + "Terraform"   = "true"
        }
    }

  # module.vnet.azurerm_network_watcher.nwatcher[0] will be created
  + resource "azurerm_network_watcher" "nwatcher" {
      + id                  = (known after apply)
      + location            = "northeurope"
      + name                = "demo-nwwatcher"
      + resource_group_name = "tfdevopstest-rg"
      + tags                = {
          + "Environment" = "dev"
          + "Name"        = "demo-nwwatcher"
          + "Owner"       = "test-user"
          + "Terraform"   = "true"
        }
    }

  # module.vnet.azurerm_resource_group.rg[0] will be created
  + resource "azurerm_resource_group" "rg" {
      + id       = (known after apply)
      + location = "northeurope"
      + name     = "tfdevopstest-rg"
      + tags     = {
          + "Environment" = "dev"
          + "Name"        = "tfdevopstest-rg"
          + "Owner"       = "test-user"
          + "Terraform"   = "true"
        }
    }

  # module.vnet.azurerm_subnet.snet["app_subnet"] will be created
  + resource "azurerm_subnet" "snet" {
      + address_prefix                                 = "10.1.3.0/24"
      + enforce_private_link_endpoint_network_policies = false
      + enforce_private_link_service_network_policies  = false
      + id                                             = (known after apply)
      + name                                           = "snet-app01"
      + resource_group_name                            = "tfdevopstest-rg"
      + service_endpoints                              = [
          + "Microsoft.Storage",
        ]
      + virtual_network_name                           = "vnet-demo-westeurope-001"
    }

  # module.vnet.azurerm_subnet.snet["gw_subnet"] will be created
  + resource "azurerm_subnet" "snet" {
      + address_prefix                                 = "10.1.2.0/24"
      + enforce_private_link_endpoint_network_policies = false
      + enforce_private_link_service_network_policies  = false
      + id                                             = (known after apply)
      + name                                           = "snet-gw01"
      + resource_group_name                            = "tfdevopstest-rg"
      + service_endpoints                              = []
      + virtual_network_name                           = "vnet-demo-westeurope-001"

      + delegation {
          + name = "demodelegationcg"

          + service_delegation {
              + actions = [
                  + "Microsoft.Network/virtualNetworks/subnets/join/action",
                  + "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
                ]
              + name    = "Microsoft.ContainerInstance/containerGroups"
            }
        }
    }

  # module.vnet.azurerm_subnet_network_security_group_association.nsg-assoc["app_subnet"] will be created
  + resource "azurerm_subnet_network_security_group_association" "nsg-assoc" {
      + id                        = (known after apply)
      + network_security_group_id = (known after apply)
      + subnet_id                 = (known after apply)
    }

  # module.vnet.azurerm_subnet_network_security_group_association.nsg-assoc["gw_subnet"] will be created
  + resource "azurerm_subnet_network_security_group_association" "nsg-assoc" {
      + id                        = (known after apply)
      + network_security_group_id = (known after apply)
      + subnet_id                 = (known after apply)
    }

  # module.vnet.azurerm_virtual_network.vnet will be created
  + resource "azurerm_virtual_network" "vnet" {
      + address_space       = [
          + "10.1.0.0/16",
        ]
      + dns_servers         = []
      + guid                = (known after apply)
      + id                  = (known after apply)
      + location            = "northeurope"
      + name                = "vnet-demo-westeurope-001"
      + resource_group_name = "tfdevopstest-rg"
      + tags                = {
          + "Environment" = "dev"
          + "Name"        = "vnet-demo-westeurope-001"
          + "Owner"       = "test-user"
          + "Terraform"   = "true"
        }

      + subnet {
          + address_prefix = (known after apply)
          + id             = (known after apply)
          + name           = (known after apply)
          + security_group = (known after apply)
        }
    }

Plan: 9 to add, 0 to change, 0 to destroy.
```
