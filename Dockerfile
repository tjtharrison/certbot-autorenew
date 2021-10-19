FROM certbot/certbot

RUN pip install certbot-dns-cloudflare cloudflare

ENTRYPOINT [ "sh","/scripts/certbot.sh" ]