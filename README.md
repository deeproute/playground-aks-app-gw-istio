
## Setup

### Deploy AKS
```sh
cd terraform/aks

# Make sure you change the tfvars to your needs
terraform init
terraform apply
```

### Deploy Istio

Follow the official documentation on installing istio. Make sure you install the istio gateway so you can configure the Istio's services type LoadBalancer which creates the AKS Managed LBs.

```sh
cd projects/playgrounds/playground-aks-appgw-istio

## This comes from the git repo helm-charts from the cx repo
k create ns istio-system
helm install -n istio-system istio-base ./charts/istio/base/1.13.9
helm install -n istio-system istiod ./charts/istio/istiod/1.13.9 --wait

k create ns istio-ingress
helm install -n istio-ingress istio-gateway ./charts/istio/gateway/1.13.9 --wait

## This comes from the official istio repo. We are using it to retrieve the prometheus and kiali addons
cd ../github

git clone git@github.com:istio/istio.git
cd istio
git checkout 1.13.9

k apply -f samples/addons/prometheus.yaml
k apply -f samples/addons/kiali.yaml

## Deploy a sample app
cd ../../playground-aks-app-gw-istio

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
- [Example code for App GW Module](https://github.com/aztfm/terraform-azurerm-application-gateway/blob/main/main.tf)
- [Enable application gateway ingress controller add-on for an existing AKS cluster with an existing application gateway](https://learn.microsoft.com/en-gb/azure/application-gateway/tutorial-ingress-controller-add-on-existing)
- [App GW TLS Termination](https://learn.microsoft.com/en-us/azure/application-gateway/ssl-overview)