#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

. ./pay-directly.sh
. ./pay-via-charlie.sh
. ./pay-via-charlie-b2.sh
. ./pay-via-charlie-hetero.sh