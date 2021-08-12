#!/bin/bash

# File	: create-repositories.sh
# Desc	: Creates Nexus repositories for Intershop project setup
# Author: the

# TODO: Adjust settings to your needs
NexusUrl="http://nexus:8081"
NexusUser="admin"
NexusPwd="********"

# May be we need to delete existing repos
#for repo in components jcenter central ishrepo distributions releases snapshots
#do 
#curl -u $NexusUser:$NexusPwd -X DELETE \
#	-H "accept: application/json" -H 'Content-Type: application/json' \
#	"$NexusUrl/service/rest/v1/repositories/$repo"
#done


# Create proxy repositories
for data in jcenter central ishrepo
do
	curl -u $NexusUser:$NexusPwd -H "accept: application/json" -H 'Content-Type: application/json' \
	"$NexusUrl/service/rest/v1/repositories/maven/proxy" -d @jsonrepos/$data.json	
done


# Create hosted repositories
for data in distributions releases snapshots
do
	curl -u $NexusUser:$NexusPwd -H "accept: application/json" -H 'Content-Type: application/json' \
	"$NexusUrl/service/rest/v1/repositories/maven/hosted" -d @jsonrepos/$data.json	
done

# Create 'components' group repositories
curl -u $NexusUser:$NexusPwd -H "accept: application/json" -H 'Content-Type: application/json' \
	"$NexusUrl/service/rest/v1/repositories/maven/group" -d @jsonrepos/components.json


