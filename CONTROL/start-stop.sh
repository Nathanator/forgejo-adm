#!/bin/sh

# Environment variable
FORGEJO_CONTAINER='Forgejo'

case "$1" in
  start)
    # Starting forgejo
    echo "forgejo-adm: Starting service..."
    docker start $FORGEJO_CONTAINER
    sleep 3
    ;;
  stop)
    # Stopping forgejo
    echo "forgejo-adm: Stopping service..."
    docker stop $FORGEJO_CONTAINER
    sleep 3
    ;;
  reload)
    # Reloading forgejo
    echo "forgejo-adm: Reloading service..."
    docker stop $FORGEJO_CONTAINER
    sleep 6
    docker start $FORGEJO_CONTAINER
    sleep 3
    ;;
  *)
    echo "usage: $0 {start|stop|reload}"
    exit 1
    ;;
esac

exit 0