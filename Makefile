uname_S := $(shell uname -s)

all: install_soft install_dotfiles

ifeq ($(uname_S),Linux)
install_soft: ## Install necessary soft on Ubuntu (Conditional on uname -s)
	@sudo apt install software-properties-common git vim ansible -y
endif
ifeq ($(uname_S),Darwin)
install_soft: ## Install necessary soft on Mac OS (Conditional on uname -s)
	@brew install ansible vim
	@brew tap d12frosted/emacs-plus
	@brew install emacs-plus
	@brew linkapps emacs-plus
endif

install_dotfiles: ## Run playbook to copy dotfiles
	@ansible-playbook dotfiles.yml -i local -v -e curdir=$(CURDIR)

help: ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
