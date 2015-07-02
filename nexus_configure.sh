#!/bin/sh

/etc/init.d/nexus restart & sleep 30
curl -i -H "Accept: application/xml" -H "Content-Type: application/xml" -f -X POST -v -d "@repositories/gradle_repository.xml" -u admin:admin123 http://127.0.0.1:8081/nexus/service/local/repositories
curl -i -H "Accept: application/xml" -H "Content-Type: application/xml" -f -X POST -v -d "@repositories/distributions_repository.xml" -u admin:admin123 http://127.0.0.1:8081/nexus/service/local/repositories
curl -i -H "Accept: application/xml" -H "Content-Type: application/xml" -f -X POST -v -d "@repositories/ishreleases_repository.xml" -u admin:admin123 http://127.0.0.1:8081/nexus/service/local/repositories
curl -i -H "Accept: application/xml" -H "Content-Type: application/xml" -f -X POST -v -d "@repositories/components_group.xml" -u admin:admin123 http://localhost:8081/nexus/service/local/repo_groups
/etc/init.d/nexus restart