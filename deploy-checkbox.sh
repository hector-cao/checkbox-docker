#!/bin/bash

[ -d $PWD/checkbox-ng ] || exit 0
[ -d $PWD/checkbox-support ] || exit 0

echo "Deploying checkbox (devel=${CHECKBOX_DEVEL_MODE})..."

exec &> /dev/null

# pwd should be inside checkbox source folder
mkdir -p /home/ubuntu/checkbox

if [ -z "${CHECKBOX_DEVEL_MODE}" ]; then
    (cd checkbox-ng && python3 -m pip install .)
    (cd checkbox-support && python3 -m pip install .)
else
    # devel mode
    # -e : install python module in editable mode
    # it will install a egg-link file that contains the path to local folder
    # example : /usr/local/lib/python3.10/dist-packages/checkbox-ng.egg-link contains : /tmp/checkbox/checkbox-ng
    (cd checkbox-ng && python3 -m pip install -e .)
    (cd checkbox-support && python3 -m pip install -e .)
fi

mkdir -p /var/tmp/checkbox-providers

rm -rf /var/tmp/checkbox-providers/base
cp -rf providers/base /var/tmp/checkbox-providers/base

rm -rf /var/tmp/checkbox-providers/resource
cp -rf providers/resource /var/tmp/checkbox-providers/resource

rm -rf /var/tmp/checkbox-providers/certification-client
cp -rf providers/certification-client /var/tmp/checkbox-providers/certification-client
