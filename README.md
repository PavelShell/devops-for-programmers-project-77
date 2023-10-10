### Hexlet tests and linter status:
[![Actions Status](https://github.com/PavelShell/devops-for-programmers-project-77/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/PavelShell/devops-for-programmers-project-77/actions)

Ansible/Terrafrom template for application deployment. Desired application is specified in "ansible/playbooks/deploy.yml" playbook.

To initialize infrastructure, run "terraform apply" from "terraform/" directory. Please make sure that you have you private key in "terraform/keys/id_rsa" and sertificate and it's key in key in "terraform/certs/certificate.crt" and "terraform/certs/private.key" respectively.

After infrastructure initialization, add IP addresses of created nodes into "ansible/inventory.ini" file, then run "make install_dependencied configure deploy" from "ansible/" directory in order to deploy your application. 

Running demo instance of the app can be found at https://dnstest.sagser.cloudns.ph/
