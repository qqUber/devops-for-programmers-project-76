install-roles:
	ansible-galaxy install -r requirements.yml

prepare:
	make install-roles & ansible-playbook --vault-password-file vault-password prepare.yml -i inventory.ini

deploy:
	ansible-playbook --vault-password-file vault-password deploy.yml -i inventory.ini

# Vault
encrypt:
	ansible-vault encrypt group_vars/webservers/vault.yml

decrypt:
	ansible-vault decrypt group_vars/webservers/vault.yml

edit:
	ansible-vault edit group_vars/webservers/vault.yml