Bcash on Docker
=====

Start up a bcash node quickly using Docker.
Pulls latest bcash version from github and starts full node.

By default, persists data in user home directory at `~/.bcash`.

How To Use
----

Copy sample configurations to `secrets/` directory:
>Important: Be sure to keep API secrets safe.
```
$ mkdir -p secrets
$ cp bcash.example.conf secrets/bcash.conf
$ cp wallet.example.conf secrets/wallet.conf
```

Create `bcash` network:
```
$ docker network create bcash
```

Create `nginx-proxy` network:
```
$ docker network create nginx-proxy
```

Quick run, node only:
```
$ docker-compose up -d bcash
```

Update to latest bcash version:
```
$ docker-compose build --pull bcash
```

HTTPS
----
Includes optional nginx wrapper for https. Add domain certs to `secrets/certs/`.

Update docker-compose `VIRUAL_HOST` domain setting.

See https://github.com/jwilder/nginx-proxy for more options.

# Wallet HTTP
Note that Wallet and Node API servers are on separate ports.
With the default `docker-compose.yml` configuration, Wallet API is accessible via `bcash.yourdomain.org:8334/wallet`, while node endpoints are accessed through default HTTP/HTTPS ports.

Provided is a simple example of an nginx proxy to allow wallet API to be accessible
on a separate domain, in order to make it unnecessary to specify wallet port.

See `docker-compose.wallet.yml`. (Not required to actually use wallet API)

# Building

By default, docker-compose will use image pulled from `petejkim/bcash:latest`,
but you can build one yourself.

Latest is hard coded into Makefile and will need updates overtime,
but you can manually pass VERSION variable to override current version.

## Examples
Build v1.0.2:
  - `make` - Same as build
  - `make build` - Currently hard coded latest.
  - `make latest` - this will tag image as latest.
  - `VERSION=v1.0.2 make build`
