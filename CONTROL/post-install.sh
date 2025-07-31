#!/bin/sh

echo "forgejo-adm: --== post-install ==--"

# Environment variables
FORGEJO_VERSION=$(cat "$APKG_PKG_DIR"/forgejo_version)
FORGEJO_CONTAINER='Forgejo'
FORGEJO_IMAGE="codeberg.org/forgejo/forgejo:$FORGEJO_VERSION"
FORGEJO_DATA_PATH='/share/Docker/Forgejo'
FORGEJO_CONFIG_PATH='/gitea/conf'
FORGEJO_UID=$(id -u 'admin')
FORGEJO_GID=$(id -g 'admin')

# Checking the configuration to install according to the user's settings
if [ -d ${FORGEJO_DATA_PATH}${FORGEJO_CONFIG_PATH} ]; then
  cd ${FORGEJO_DATA_PATH}${FORGEJO_CONFIG_PATH} || exit 1

  # Backing configuration
  if [ "$APKG_PKG_STATUS" = 'upgrade' ]; then
    # Saving the configuration
    echo "forgejo-adm: Saving configuration (app.ini.old)..."
    cp -f app.ini app.ini.old
  fi

  # Integrity check
  echo "forgejo-adm: Integrity check-up for users of the old version of forgejo by iGi"
  if [ $(cat app.ini | grep RUN_USER | awk '{print $3}') != 'git' ]; then
    sed -i 's/\(RUN_USER =\).*/RUN_USER = git/' app.ini
    chown -R $FORGEJO_UID:$FORGEJO_GID ../../../Forgejo
  fi
fi

# Pull the container image
echo "forgejo-adm: Fetching data"
docker pull "$FORGEJO_IMAGE"

# Installing creating container
echo "forgejo-adm: Creating container"
docker create -i -t --name=$FORGEJO_CONTAINER \
  --publish 3122:22 \
  --publish 3100:3000 \
  --env USER_UID="$FORGEJO_UID" \
  --env USER_GID="$FORGEJO_GID" \
  --restart=unless-stopped \
  --volume $FORGEJO_DATA_PATH:/data \
  --volume /etc/localtime:/etc/localtime:ro \
  "$FORGEJO_IMAGE"

echo "forgejo-adm: Installation/Update complete"

# Starting container
echo "forgejo-adm: Starting container"
docker start $FORGEJO_CONTAINER

exit 0