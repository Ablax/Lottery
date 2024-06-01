-include .env

.PHONY: all test deploy

DEFAULT_ANVIL_KEY := 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80

help:
	@echo "Please use 'make <target>' where <target> is one of"
	@echo "  deploy [ARGS=...]   to deploy the application"
	@echo "  all       to run all the tests and deploy the application"
	@echo "  test      to run all the tests"

build:; forge build

test:; forge test


NETWORK_ARGS := --rpc-url http://localhost:8545 --private-key $(DEFAULT_ANVIL_KEY) --broadcast
ifeq ($(findstring --network sepolia,$(ARGS)),--network sepolia)
	NETWORK_ARGS := --rpc-url $(SEPOLIA_RPC_URL) --private-key $(SEPOLIA_PRIVATE_KEY) --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv
endif

deploy :
	@echo "Deploying the application"
	@forge script script/DeployRaffle.s.sol:DeployRaffle $(NETWORK_ARGS)