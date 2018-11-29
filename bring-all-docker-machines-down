if [ -z "$(docker ps -aq)" ]; then
  echo "No docker machines appear to be up."
else
  echo "Stopping..."
  docker stop "$(docker ps -aq)"
  echo "Removing..."
  docker rm $(docker ps -aq)
  echo "Ctrl-C or will remove images..."
  sleep 5;
  docker rmi $(docker images -q)
fi


echo "Ctrl-C or will rm networks..."
sleep 5;
networks=$(docker network ls -q --filter="type=custom")
if [ -z "$networks" ]; then
  echo "No docker networks appear to exist."
else
  docker network rm $networks
fi
