# dyn-gandi-docker

![Docker](https://github.com/bozzo/dyn-gandi-docker/workflows/Docker/badge.svg)

Docker image for dyn-gandi (https://github.com/Danamir/dyn-gandi)

## Docker

Edit the config file with your API-KEY and your DNS domain and run the following command:

```shell
docker run --rm -v config.ini:/etc/dyn-gandi/config.ini zbozzo/dyn-gandi:main 
```

## Kubernetes

This will create a CronJob to update DNS record periodically.

After editing the config file with your API-KEY and your DNS domain, run the following command:

```shell
ku create secret generic dyn-gandi-config --from-file config.ini --namespace my-namespace
kubectl apply -f k8s-deployment.yml -n my-namespace
```
