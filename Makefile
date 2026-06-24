
.PHONY: sp-login login cluster cluster-up cluster-down

login: sp-login
sp-login:
	./scripts/sp-login.sh

cluster: cluster-up
cluster-up:
	(cd ./cluster; ./up.sh)
cluster-down:
	(cd ./cluster; ./down.sh)