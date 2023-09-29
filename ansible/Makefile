install_dependencies:
	ansible-galaxy install -r requirements.yml

configure:
	ansible-playbook playbooks/setup.yml -i inventory.ini --ask-vault-password

deploy:
	ansible-playbook playbooks/deploy.yml -i inventory.ini --ask-vault-password
