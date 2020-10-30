
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
   <td><a href=https://victormorales0871@dev.azure.com/victormorales0871/TFLandingZone/_git/tfdm2.pulin.gupta/commit/917c18e0ae27a2ae3cdfe710f3f3429a08dd1a5b>917c18e0ae27a2ae3cdfe710f3f3429a08dd1a5b</a></td>
</tr>
<tr>
   <td><b>Latest Commit Message</b></td>
   <td><pre>Build tfdm2.pulin.gupta.272.25</pre></td>
</tr>
</table>

## Terraform Show Output

``` sh

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # module.vnet.azurerm_subnet.snet["gw_subnet"] will be updated in-place
  ~ resource "azurerm_subnet" "snet" {
        address_prefix                                 = "10.1.2.0/24"
        enforce_private_link_endpoint_network_policies = false
        enforce_private_link_service_network_policies  = false
        id                                             = "/subscriptions/e5f3913a-4b59-46d9-bd7d-8466273a0edd/resourceGroups/tfdevopstest-rg/providers/Microsoft.Network/virtualNetworks/vnet-demo-westeurope-001/subnets/snet-gw01"
        name                                           = "snet-gw01"
        resource_group_name                            = "tfdevopstest-rg"
        service_endpoints                              = []
        virtual_network_name                           = "vnet-demo-westeurope-001"

      ~ delegation {
            name = "demodelegationcg"

          ~ service_delegation {
              ~ actions = [
                  - "Microsoft.Network/virtualNetworks/subnets/action",
                  + "Microsoft.Network/virtualNetworks/subnets/join/action",
                  + "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
                ]
                name    = "Microsoft.ContainerInstance/containerGroups"
            }
        }
    }

Plan: 0 to add, 1 to change, 0 to destroy.
```
