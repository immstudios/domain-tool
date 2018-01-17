#!/bin/bash
cd "$(dirname "$0")"

for config in config/*.ini; do
    certbot certonly --agree-tos -n -c $config
done

