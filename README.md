# aws-iaac-wp

## run ansible playbook for wp configuration
```
ansible-playbook -i ansible/inventory/inventory.ini \ 
  -u ec2-user \
  --private-key=~/.ssh/aws-key-pair.pem \
  -e "ansible_ssh_common_args='-o StrictHostKeyChecking=no'" \
  ansible/playbooks/wordpress_setup.yml
```

## set env variables
```
source set_env.sh
```

## ssh to EC2
```
ssh -i ~/.ssh/aws-key-pair.pem ec2-user@IP
```