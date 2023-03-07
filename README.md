# AKS with Azure Application Gateway with Istio Ingress
## Setup

### Deploy AKS
```sh
cd terraform/aks

# Make sure you change the tfvars to your needs
terraform init
terraform apply
```

### Deploy Istio

Follow the official documentation on installing istio. Make sure you install the istio gateway so you can configure the Istio's services with type LoadBalancer which creates the AKS Managed LBs.

You can install the istio addons like this:
```sh
git clone git@github.com:istio/istio.git
cd istio

k apply -f samples/addons/prometheus.yaml
k apply -f samples/addons/kiali.yaml
```

### Deploy a sample app

From the root folder of this repo:

```sh
k create ns test-app

k label namespace test-app istio-injection=enabled --overwrite
k apply -f app/.
```

### Deploy Azure App Gateway

```sh
cd playground-aks-appgw-istio/terraform/appgw

terraform init
terraform apply
```

## References

- [Istio Ingress Health Check](https://github.com/istio/istio/issues/9385#issuecomment-466788157)
- [Example deployment of App GW and Istio](https://itnext.io/using-application-gateway-waf-with-istio-315b907b8ed7)
- [Example code for App GW Module](https://github.com/aztfm/terraform-azurerm-application-gateway/blob/main/main.tf)
- [Enable application gateway ingress controller add-on for an existing AKS cluster with an existing application gateway](https://learn.microsoft.com/en-gb/azure/application-gateway/tutorial-ingress-controller-add-on-existing)
- [App GW TLS Termination](https://learn.microsoft.com/en-us/azure/application-gateway/ssl-overview)