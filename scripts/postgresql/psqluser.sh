#!/usr/bin/env bash
source $(dirname $0)/../../state.sh
source $(directory)/bin/create_psql_user/create_psql_user.sh

create_psql_user $1
