#!/bin/bash
set -e


function clickquery() {
    local query="$@"
    echo "$query"
    clickhouse-client -q "$query"
    echo -e 'OK\n'
}

REFER="ngx_pu"
CLUSTER='front_logs'
TABLES='ngx_ac_moi'

for TABLE in $TABLES ; do
  echo $TABLE
  clickquery "CREATE TABLE ${TABLE}        ON CLUSTER ${CLUSTER} as ${REFER} ENGINE = MergeTree() PARTITION BY date ORDER BY time SETTINGS index_granularity = 8192"
  clickquery "CREATE TABLE ${TABLE}_d      ON CLUSTER ${CLUSTER} as ${TABLE} ENGINE = Distributed(${CLUSTER}, default, ${TABLE} )"
  clickquery "CREATE TABLE ${TABLE}_buffer ON CLUSTER ${CLUSTER} as ${TABLE} ENGINE = Buffer(default, ${TABLE}, 8, 10, 10, 10000000, 10000000, 100000000, 100000000)"
done
