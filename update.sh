#!/bin/bash

for config in config/*.ini; do
    certbot certonly --agree-tos -n -c $config
done

