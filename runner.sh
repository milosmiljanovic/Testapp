#!/usr/bin/env bash
if [ "$1" == "production" ] || [ "$1" == "prod" ]; then pwd && ls
    docker-compose -f docker-compose.production.yml up --build --remove-orphans -d
elif [ -z "$1" ] || [ "$1" == "development" ] || [ "$1" == "dev" ]; then pwd && ls
    docker-compose -f docker-compose.development.yml up --build --remove-orphans -d
else
    echo "Unknown environment: $1";
    exit 1;
fi


# Remove old images, containers, networks...
docker system prune -f