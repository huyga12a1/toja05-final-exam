#!/bin/bash

echo "********************"
echo "** Pushing image ***"
echo "********************"

echo "** Logging in ***"
docker login -u huyga12a1 -p $PASS

case $@ in
  NodeJS)
    echo "*** Tagging image ***"
    docker tag nodejsapp:$BUILD_TAG huyga12a1/nodejsapp:latest
    echo "*** Pushing image ***"
    docker push huyga12a1/nodejsapp:latest
    ;;
  Python)
    echo "*** Tagging image ***"
    docker tag pythonapp:$BUILD_TAG huyga12a1/pythonapp:latest
    echo "*** Pushing image ***"
    docker push huyga12a1/pythonapp:latest
    ;;
  All)
    echo "*** Tagging image ***"
    docker tag nodejsapp:$BUILD_TAG huyga12a1/nodejsapp:latest
    docker tag pythonapp:$BUILD_TAG huyga12a1/pythonapp:latest
    echo "*** Pushing image ***"
    docker push huyga12a1/nodejsapp:latest
    docker push huyga12a1/pythonapp:latest
    ;;
  *)
    echo "Not push anything"  
esac
