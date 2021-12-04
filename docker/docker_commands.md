# Container Commands

docker

### Listing Commands
`docker images` - lists all images

`docker ps` - lists all running containers

`docker container ls` - " " " "

`docker ps -a` - lists all containers

`docker {asset_type} inspect {asset_id}` - gives detailed information on an "asset". An asset is either a container, image or network. If {asset_type} is left blank, by default this value is "container". The {asset_id} would be the {container_id} in this case.

### Building Commands
`docker build -t {image_name}:{image_tag} path/to/Dockerfile` - creates an image from a Dockerfile (easiest if done in the dir where it's located)

`docker buildx build --platform=linux/amd64 {image_name}:{image_tag} path/to/Dockerfile` - same as above for M1 chip

`docker commit {container_id} {image_name}:{image_tag}` - creates an image from a container

`docker run -ti {image_name}:{image_tag}` - creates a container. if there is no image tag, the default, `latest`, will be used

*Options*

`-d` - when used with `run`, will start container in the background, preventing you from automatically connecting to container

`-i` - when used with `run`, allows for standard input

`--name` - when used with `run`, you can name your container. It is followed by a `{container_name}` of your choosing

`--net` - when used with `run`, you can associate your container with a network. This network must exist

`-p` - when used with `run`, you can expose ports on the container. It is followed by `{host_port}/{container_port}.` If no host port is given, Docker will automatically assign one.

`--rm` - when used with `run`, will clean up container and remove file systems

`-t` - when used with `run`, allows for terminal access

`-v` - when used with `run`, will bind mount a directory from the local host. It is followed by the absolute path to the directory. Example: `docker run -ti -v {absolute_path}:{designated_name_of_directory_for_container}/ {image_name:image_tag}`

### Connecting to Container Commands
`docker start {container_id}` - starts an existing container. 

`docker attach {container_id}` - connects to container. if using exit to disconnect from container, **will** power off container

`docker exec -ti {container_id} bash` - connects to container + specifies shell. if using exit to disconnect from container, **won't** power off container

### Disconnecting Commands
`exit` - exits from a container, may or may not turn off container

`Ctrl + P` then `CTRL + Q` = exits from container without powering it off

### Turning Off and Removing Commands
`docker kill {container_id}` - turn off a container

`docker container kill $(docker ps -q)`- turn off all containers

`docker container rm {container_id}` - delete a container (must be turned off). can enter multiple ID's separated by spaces

`docker container prune` - delete all containers (must be turned off)

`docker rmi {image_name}` - remove image

### Docker Hub Commands
`docker pull {image_name}` - pulls an image from Docker Hub

`docker tag {local_image_name}:{tag_name} {repo_name}/{target_image_name}:{tag name}` - create new image and tag it

`docker push {repo_name}/{image_name}:{tag_name}` - push an image to a specified repo

### Networking Commands
`docker network ls` - lists all networks

`docker network create {network_name}` - create network

`--net` option - look under **Building Commands** above

`docker network inspect {net_name}` - gives information about a network

`check /etc/resolv.conf` has teh local dns ---- maybe

`docker run -ti -p 45678:8080 ncat:v1.0 bash`- starts a container with a ports open


**Inside new container with ports**
`nc -lp 8080`- adds a port listener on 8080 (nc allows you to connect and open a port on the system you run nc on. ncat listen on port 8080)

**Back Outside**
`nc localhost 45678` - CONENCT to localhost port now you can send messages between each other

`docker run -ti -p 45672:8000 ncat:v1.0 bash` - create new container with different port

inside first new container
`nc -lp 8080` - open up the port again

inside newest container
`nc {ip of the above container} 8080` - connect to that port
