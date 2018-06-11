#!/bin/bash
wifi_name=$1
grep -Po "(?<=Passphrase=).*$|(?<=Name=).*$" $(grep -ril "$wifi_name" /var/lib/connman/)
