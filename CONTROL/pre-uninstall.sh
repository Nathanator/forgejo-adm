#!/bin/sh

echo "forgejo-adm: --== pre-uninstall ==--"

# Environment variables
FORGEJO_VERSION=$(cat $APKG_PKG_DIR/forgejo_version)
FORGEJO_CONTAINER=$(docker container ls -a | grep Forgejo | awk '{print $1}')
FORGEJO_IMAGE=$(docker images | grep forgejo/forgejo | grep $FORGEJO_VERSION | awk '{print $3}')

# Force shutdown of the container and delete it
echo "forgejo-adm: Stopping and removing container"
echo "    - $FORGEJO_CONTAINER"
if [ -n "$FORGEJO_CONTAINER" ]; then
  docker kill "$FORGEJO_CONTAINER"
  sleep 2
  docker rm -f "$FORGEJO_CONTAINER"
fi

# REMOVE docker image on uninstalling & updating
echo "forgejo-adm: Removing docker image"
echo "forgejo-adm: Image ID: $FORGEJO_IMAGE"
if [ -n "$FORGEJO_IMAGE" ]; then
  docker rmi -f "$FORGEJO_IMAGE"
fi

exit 0