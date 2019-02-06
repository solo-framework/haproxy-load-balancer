#!/bin/bash


if [[ "$1" = "set-uc" ]];then

    sed -i 's/default_backend web-backend-with-ssl/default_backend under-construction/g' ./haproxy.cfg
fi

if [[ "$1" = "remove-uc" ]];then

    sed -i 's/default_backend under-construction/default_backend web-backend-with-ssl/g' ./haproxy.cfg
fi


echo "Reload config..."
# docker kill -s HUP haproxy_load_balancer
docker restart haproxy_load_balancer