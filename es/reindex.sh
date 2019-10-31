#!/bin/bash
# file:reindex.sh
indexName="items-20190125"
newClusterUser="alone_search_es6"
newClusterPass=""
newClusterHost="http://172.16.104.21:9210"
oldClusterUser="search_es6"
oldClusterPass=""
# 老集群host必须是[scheme]://[host]:[port]，例如http://10.37.1.1:9200
oldClusterHost="172.16.104.20:9210"
curl -u ${newClusterUser}:${newClusterPass} -XPOST "http://${newClusterHost}/_reindex?pretty" -H "Content-Type: application/json" -d'{
    "source": {
        "remote": {
            "host": "'${oldClusterHost}'",
            "username": "'${oldClusterUser}'",
            "password": "'${oldClusterPass}'"
        },
        "index": "'${indexName}'",
        "query": {
            "match_all": {}
        }
    },
    "dest": {
       "index": "'${indexName}'"
    }
}'