install_soft:
	sudo apt-get install software-properties-common -y
	sudo apt-add-repository ppa:ansible/ansible -y
	sudo apt-get update -y
	sudo apt-get install git vim ansible -y

install_dotfiles:
	/usr/bin/ansible-playbook dotfiles.yml -i local -v -e curdir=$(CURDIR)

install_vim:
	vim -i NONE -c PluginInstall -c quitall

install_all: install_soft install_dotfiles install_vim
