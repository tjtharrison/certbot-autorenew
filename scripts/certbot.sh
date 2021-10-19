#!/bin/bash

set -e

echo $CLOUDFLARE_API_TOKEN

## Global vars
EVERY_DAYS="$EVERY_DAYS"
RENEW_IF_VALID="$RENEW_IF_VALID"
EMAIL="$EMAIL"
DOMAINS="$DOMAINS"

## Calculate seconds to sleep
SLEEP_SECONDS=$(( $EVERY_DAYS * 86400))

## Should certificates should be reissued every run
if [[ $RENEW_IF_VALID == "no" ]]; then
    RENEW_ANSWER="1"
else
    RENEW_ANSWER="2"
fi

## Loop indefinitely
while true; do
    IFS=','; for DOMAIN in $DOMAINS; do
        ## Generate SSL certificates for Domains
        echo $RENEW_ANSWER | certbot certonly --dns-cloudflare --dns-cloudflare-credentials /etc/letsencrypt/cloudflare.ini -d $DOMAIN --email $EMAIL --agree-tos 
    done
    echo "Sleeping for $SLEEP_SECONDS"
    sleep $SLEEP_SECONDS
done