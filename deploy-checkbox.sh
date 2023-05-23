#!/bin/bash

exec &> /dev/null

# pwd should be inside checkbox source folder
mkdir -p /home/ubuntu/checkbox

(cd checkbox-ng && python3 -m pip install -e .)
(cd checkbox-support && python3 -m pip install -e .)

mkdir -p /var/tmp/checkbox-providers

rm -rf /var/tmp/checkbox-providers/base
cp -rf providers/base /var/tmp/checkbox-providers/base

rm -rf /var/tmp/checkbox-providers/resource
cp -rf providers/resource /var/tmp/checkbox-providers/resource

rm -rf /var/tmp/checkbox-providers/certification-client
cp -rf providers/certification-client /var/tmp/checkbox-providers/certification-client
