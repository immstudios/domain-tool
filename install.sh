#!/bin/bash

apt update || exit
apt install certbot || exit

if [ ! -d "config" ]; then
    mkdir "config"
fi

echo "SHELL=/bin/sh" > /etc/cron.d/certbot
echo "PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin" >> /etc/cron.d/certbot
echo "0 */12 * * * root test -x /usr/bin/certbot && perl -e 'sleep int(rand(3600))' && certbot -q renew --renew-hook \"systemctl reload nginx\"" >> /etc/cron.d/certbot

