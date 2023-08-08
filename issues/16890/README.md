# Issue
Reproduction of https://github.com/vectordotdev/vector/issues/16890

# Reproduction

```
./tls-gen-script.sh
./convert-certs.sh
docker-compose -f ~/rabbitmq/docker-compose-aqmp.yaml  up -d
# update config paths
path/to/vector/target/debug/vector -v  --config path/to/tls_not_working.toml
```
