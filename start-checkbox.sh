#!/bin/bash

/tmp/deploy-checkbox.sh

exec checkbox-cli "$@"
