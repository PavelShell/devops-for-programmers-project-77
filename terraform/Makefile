create_infrastrucuture:
	terraform apply
	echo -n "ansible_host: " > ../ansible/host_vars/DO_server_first/ansible_vars.yml
	terraform output -raw DO1_ip >> ../ansible/host_vars/DO_server_first/ansible_vars.yml                                     
	echo -n "ansible_host: " > ../ansible/host_vars/DO_server_second/ansible_vars.yml
	terraform output -raw DO1_ip >> ../ansible/host_vars/DO_server_second/ansible_vars.yml                                      
	                                     