#!/bin/sh

curl -i -H "Accept: application/xml" -H "Content-Type: application/xml" -f -X DELETE -u admin:admin123 http://127.0.0.1:8081/nexus/service/local/repositories/thirdparty
curl -i -H "Accept: application/xml" -H "Content-Type: application/xml" -f -X DELETE -u admin:admin123 http://127.0.0.1:8081/nexus/service/local/repositories/apache-snapshots
curl -i -H "Accept: application/xml" -H "Content-Type: application/xml" -f -X DELETE -u admin:admin123 http://127.0.0.1:8081/nexus/service/local/repositories/central-m1


curl -H "Content-Type: application/json" -X POST -d "@repositories/jcenter_repository.json" -u admin:admin123 http://127.0.0.1:8081/nexus/service/local/repositories
curl -H "Content-Type: application/json" -X POST -d "@repositories/ishrepo_repository.json" -u admin:admin123 http://127.0.0.1:8081/nexus/service/local/repositories
curl -H "Content-Type: application/json" -X PUT -d "@repositories/ishrepo_config.json" -u admin:admin123 http://127.0.0.1:8081/nexus/service/local/repositories/ishrepo/routing/config

curl -i -H "Accept: application/xml" -H "Content-Type: application/xml" -f -X POST -v -d "@repositories/distributions_repository.xml" -u admin:admin123 http://127.0.0.1:8081/nexus/service/local/repositories

curl -i -H "Accept: application/xml" -H "Content-Type: application/xml" -f -X POST -v -d "@repositories/components_group.xml" -u admin:admin123 http://localhost:8081/nexus/service/local/repo_groups
