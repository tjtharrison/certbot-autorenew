# certbot-autorenew

## Cloudflare API Token

In Cloudflare, generate an API token with permissions to edit your required Zone. Make a note of this.

Create cloudflare.env file with your cloudflare API token as follows:

```
echo 'dns_cloudflare_api_token = "[your-token]"' > config/cloudflare.ini
```

## Update docker-compose file

Update the following values in the docker-compose file:

```
EVERY_DAYS=1                    ## How often you wish certbot to run, daily (1) suggested
EMAIL=certbot@tjth.co           ## The email address to use for certbot validation
DOMAINS=example.tjth.co         ## Comma separated list of domains to validate
RENEW_IF_VALID=no               ## Whether certbot should always replace the certificate
```