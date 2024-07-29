# WordPress on AWS with Terraform and Ansible

This project automates the deployment of a WordPress site on AWS using Terraform for infrastructure provisioning and Ansible for configuration management.

## Architecture

- VPC with public and private subnets across two availability zones
- EC2 instance running WordPress in a public subnet
- RDS MySQL instance in private subnets
- NAT Gateway for outbound internet access from private subnets
- Security groups for EC2 and RDS instances

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform (v0.12+)
- Ansible (v2.9+)
- SSH key pair for EC2 instance access

## Setup

1. Clone this repository:
   ```
   git clone <repository-url>
   cd <repository-name>
   ```

2. Initialize Terraform:
   ```
   terraform init
   ```

3. Create a `terraform.tfvars` file with the following content:
   ```
   db_username = "your_db_username"
   db_password = "your_db_password"
   ```

4. Deploy the infrastructure:
   ```
   terraform apply
   ```

5. Set up environment variables for Ansible:
   ```
   source scripts/set_env.sh
   ```

6. Run the Ansible playbook:
   ```
   ansible-playbook -i ansible/inventory/inventory.ini \ 
     -u ec2-user \
     --private-key=~/.ssh/aws-key-pair.pem \
     -e "ansible_ssh_common_args='-o StrictHostKeyChecking=no'" \
     ansible/playbooks/wordpress_setup.yml
   ```

## Accessing WordPress

After successful deployment, you can access your WordPress site using the EC2 instance's public IP or public DNS, which can be found in the Terraform outputs.

## Clean Up

To destroy the created resources:

```
terraform destroy
```