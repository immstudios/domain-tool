#!/bin/bash
cd "$(dirname "$0")"

for config in config/*; do
    domain_name=$(basename $config)
    echo ""
    echo "Renewing $domain_name"
    certbot certonly --agree-tos --expand -n -c $config --cert-name $domain_name
done

nginx -s reload
