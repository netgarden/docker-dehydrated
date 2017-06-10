# docker-dehydrated
Docker image for dehydrated (ACME client)
Link: https://github.com/lukas2511/dehydrated

Usage:

# mkdir /opt/dehydrated
# docker run --rm -it -v /opt/dehydrated:/data netgarden/dehydrated
# cd /opt/dehydrated

# vim config/config
# vim config/domains.txt

# ./docker-dehydrated --register --accept-terms
# ./docker-dehydrated -c
