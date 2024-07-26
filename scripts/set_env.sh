#!/bin/bash
cd ../terraform
export DB_NAME=$(terraform output -raw db_name)
export DB_USER=$(terraform output -raw db_username)
export DB_PASSWORD=$(terraform output -raw db_password)
export DB_HOST=$(terraform output -raw database_endpoint)
export WEB_SERVER_IP=$(terraform output -raw web_server_public_ip)
cd ../scripts
echo "[webservers]" > ../ansible/inventory/inventory.ini
echo "$WEB_SERVER_IP" >> ../ansible/inventory/inventory.ini