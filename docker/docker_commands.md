### Listing Commands
`docker images` - lists all images

`docker ps` - lists all running containers

`docker container ls` - " " " "

`docker ps -a` - lists all containers

### Building Commands
`docker build {image_name}:{image_tag} path/to/Dockerfile` - creates an image from a Dockerfile (easiest if done in the dir where it's located)

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

### Networking Commands
`docker network ls` - lists all networks

`docker network create {network_name}` - create network

`--net` option - look under **Building Commands** above
