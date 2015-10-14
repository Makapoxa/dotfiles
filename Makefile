uname_S := $(shell uname -s)

all: install_soft install_dotfiles

ifeq ($(uname_S),Linux)
install_soft: ## Install necessary soft on Ubuntu (Conditional on uname -s)
	@sudo apt install software-properties-common git vim ansible curl -y
	@curl -LSfs https://raw.githubusercontent.com/cantino/mcfly/master/ci/install.sh | sudo sh -s -- --git cantino/mcfly
endif
ifeq ($(uname_S),Darwin)
install_soft: ## Install necessary soft on Mac OS (Conditional on uname -s)
	@brew install ansible vim curl
	@curl -LSfs https://raw.githubusercontent.com/cantino/mcfly/master/ci/install.sh | sudo sh -s -- --git cantino/mcfly
endif

install_dotfiles: ## Run playbook to copy dotfiles
	@ansible-playbook dotfiles.yml -i local -v -e curdir=$(CURDIR)

help: ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
