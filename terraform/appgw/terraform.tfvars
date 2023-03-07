region              = "eastus2"
resource_group_name = "playground-aks-gw-istio"

tags = {
  Owner = "deeproute"
}

name                      = "appgw-aks-istio"
vnet_name                 = "infra"
vnet_subnet_name          = "aks-appgw"
backend_pool_name         = "aks-loadbalancer-beap"
backend_pool_ip_addresses = ["20.96.146.82"] # After AKS is created and a service with type = LoadBalancer is created then we put the LB IP here
