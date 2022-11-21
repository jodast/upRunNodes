UpRunner - run nudes
-----

# Reverse Proxy setup
```bash
sudo certbot --nginx --domain <HOSTNAME> --register-unsafely-without-email --no-redirect --agree-tos
cp nginx/proxy /etc/nginx/conf.d/
```

# LeanPokt docker setup
## build image
```bash
docker build --no-cache --build-arg GOLANG_IMAGE_VERSION=golang:1.19.2-alpine --build-arg BRANCH_NAME=ethereal-wombat -t pocket-core:ethereal-wombat .
```
## run image
```bash
docker run \
#   -it --entrypoint=bash \
  -p 8082:8082 \
  -p 8081:8081 \
  -p 26656:26656 \
  -p 26657:26657 \
  -e POCKET_CORE_GENESIS=/home/app/.pocket/config/genesis.json \
  -e POCKET_CORE_CHAINS=/home/app/.pocket/config/chains.json \
  -e POCKET_CORE_CONFIG=/home/app/.pocket/config/config.json \
  -v /srv/poktNodes/upRunNodes/config:/home/app/.pocket/config:rw \
  -v /home/ec2-user:/home/app/.pocket/data:rw \
  pocket-core:ethereal-wombat
#   start --mainnet
```
## (WIP) inside container
```bash
pocket accounts import-armored /home/app/.pocket/config/pocket-account-<wallet-address>.json
```
OR 
```bash
pocket accounts create
```
```bash
pocket accounts export-raw <wallet-address> >> /home/app/.pocket/config/lean_nodes_keys.json # add priv_key
pocket accounts set-validators /home/app/.pocket/config/lean_nodes_keys.json
pocket start --mainnet --simulateRelay
```