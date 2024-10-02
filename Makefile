############################# HELP MESSAGE #############################
# Make sure the help command stays first, so that it's printed by default when `make` is called without arguments
.PHONY: help tests
help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: ## 
	go build -o bin/evm-tx-load-gen

run: ## 
	./run.sh

docker-build: ## 
	docker buildx build --platform linux/amd64,linux/arm64 . -t ghcr.io/layr-labs/evm-tx-load-gen

docker-push: ## 
	docker buildx build --platform linux/amd64,linux/arm64 . -t ghcr.io/layr-labs/evm-tx-load-gen --push