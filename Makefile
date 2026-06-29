
.PHONY: sp-login login cluster cluster-up cluster-down vnet vnet-up vnet-down

login: sp-login
sp-login:
	./scripts/sp-login.sh

vnet: vnet-up
vnet-up:
	(cd ./vnet; ./up.sh)
vnet-down:
	(cd ./vnet; ./down.sh)

cluster: cluster-up
cluster-up:
	(cd ./cluster; ./up.sh)
cluster-down:
	(cd ./cluster; ./down.sh)