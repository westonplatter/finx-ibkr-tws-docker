# Finx IBKR TWS Docker

## Features

- **Fully containerized** IBKR TWS instance + [IBC Alpha](https://github.com/IbcAlpha) in Docker, no external dependencies
- **TWS API access** (automatically configured), proxied to localhost internally via `nginx`
- **Supports noVNC** (a browser-based VNC client, proxied via Websockify)
- **Autorestarts TWS automatically** (for example, due to daily logoff)

## Getting Started

- Install [Docker](https://docs.docker.com/get-docker/)
- Clone this repo:
  - `git clone https://github.com/westonplatter/finx-ibkr-docker.git`
  - `cd finx-ibkr-docker`
- Create env file
  - `cp env-file-sample env-file-myfile`
  - add username, password, trade_mode and read_only_login settings
- Build the image:
  - `docker-compose build`
- Start the container:
  - `docker-compose up -d`
  - TWS API is available on port `8888` by default
  - You can view the noVNC client at [localhost:6080/vnc.html](http://localhost:6080/vnc.html)
- To stop: `docker-compose down`

## Paper vs Live Account

The the container connects to either a live or paper account based on the IBKR_TRADING_MODE=[live|paper].

The API port is exposed as localhost:8888 in either (live or paper) case.


## TWS Version Changes

TWS is updated frequently. Whenever the major version is incremented, you need to reconfigure the script.

Modify the value of `TWS_MAJOR_VRSN` in `docker-compose.yml` to the latest version number without periods/alphabets (i.e. 10.11e -> 1011)

## Changes from the default config.ini

```config
AcceptBidAskLastSizeDisplayUpdateNotification=accept
AcceptIncomingConnectionAction=accept
AcceptNonBrokerageAccountWarning=yes
```

## Credit
Forked and renamed from Nicholas' work, https://github.com/extrange/ibkr-docker.

## License
BSD-3. See LICENSE file
