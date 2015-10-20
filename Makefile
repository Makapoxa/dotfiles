install_soft:
	sudo apt-get install software-properties-common
	sudo apt-add-repository ppa:ansible/ansible
	sudo apt-get update
	sudo apt-get install git vim ansible

install_dotfiles:
	ansible-playbook dotfiles.yml -i local -v -e curdir=$(CURDIR)

install_vim:
	vim -i NONE -c PluginInstall -c quitall

install_all: install_soft install_dotfiles install_vim
