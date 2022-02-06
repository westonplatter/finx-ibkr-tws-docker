

up:
	IBKR_TRADING_MODE=paper docker-compose up

up.live:
	IBKR_TRADING_MODE=live docker-compose up


#------------------------------------------------------------------------------
#
# docker dev helpers. not intended for production use
#
#

DOCKER_TAG ?= finx-ibkr-tws-docker

bash:
	IBKR_TRADING_MODE=live docker-compose run --entrypoint /bin/bash ibkr

build:
	docker build \
		--build-arg ibc_version=3.12.0 \
		--tag ${DOCKER_TAG} \
		app
