## K3S Testbed
Building non-trivial projects for on-prem K8S clusters is frustrating due to the sheer number of infrastructure dependencies such a project entails. For example, a project using Kafka first needs an available Kafka cluster, configured brokers, storage (if persistence is enabled), TLS certs (if SSL is enabled), a ui dashboard, application proxies (if allowing external conncetions).

Setting up all these infrastructure components can easily take weeks & leads to obscure networking/configuration rabbit-holes. To spare anyone reading this the same frustrations, `k3s-testbed` contains scripts for setting up/configuring a number of common helm charts. These include:
- Metallb (allows mock loadbalancers for bare-metal deployments)
- Longhorn (in-cluster block storage)
- Cert-Manager (creates wildcard TLS certificates via LetsEncrypt)
  - (configured to use AWS Route53 for DNS challenge)
- Docker Registry (w/ Signed TLS/SSL Cert)
- Traefik (HTTP/S application proxy & authentication)
- Kubernetes-Dashboard
- Kafka (includes external TLS proxy, UI Dashboard, Schema Registry)
- Airflow (includes gitsync configuration for DAGs)