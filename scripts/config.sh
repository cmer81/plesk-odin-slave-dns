#!/usr/bin/env bash

echo $DNS_IP_MASTER

echo 'controls {
    inet * port 953 allow { '$DNS_IP_MASTER'; 127.0.0.1; } keys { "rndc-key"; "rndc-key-'$DNS_IP_MASTER'"; };
};' >> /etc/bind/named.conf.local

echo 'key "rndc-key-'$DNS_IP_MASTER'" {
  algorithm hmac-md5;
  secret "'$RNDC_KEY'";
};' >> /etc/bind/rndc.key
