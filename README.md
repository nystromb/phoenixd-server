# PhoenixWallet Daemon Dockerfile

This repo just contains a dockerfile that installs phoenix server to be deployed to Fly.io. Use Fly volumes to create peristent data store to keep the configuration between restarts.

## Dependencies

* Docker
* Fly.io CLI

## How to build

`docker build --platform linux/amd64 -t phoenixd:0.6.3 .`

## How to run locally

`docker run -d -p 9740:9740 phoenixd:0.6.3`

## How to deploy

Install the Fly.io CLI and run the following commands

```bash
fly auth login
fly launch
fly deploy
```
