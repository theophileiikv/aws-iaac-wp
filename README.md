# aws-iaac-wp

## run ansible playbook for wp configuration

```
ansible-playbook -i ansible/inventory/inventory.ini \ 
  -u ec2-user \
  --private-key=~/.ssh/aws-key-pair.pem \
  -e "ansible_ssh_common_args='-o StrictHostKeyChecking=no'" \
  ansible/playbooks/wordpress_setup.yml
```