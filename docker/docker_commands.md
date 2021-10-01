### Listing Commands
`docker images` - lists all images
`docker ps` - lists all running containers
`docker container ls` - " " " "
`docker ps -a` - lists all containers

### Building Commands
`docker commit {container_id} {image_name}:{image_tag}` - creates an image
`docker run -ti {image_name}:{image_tag}` - creates a container. if there is no image tag, the default, `latest`, will be used
*Options*
`-i` - when used with `run`, allows for standard input
`-t` - when used with `run`, allows for terminal access
`--rm` - when used with `run`, will clean up container and remove file systems
`-d` - when used with `run`, will start container in the background, preventing you from automatically connecting to container
`-v` - when used with `run`, will bind mount a directory from the local host. Should be the last option and is followed by the absolute path to the directory. Example: `docker run -ti -v {absolute_path}:{designated_name_of_directory_for_container} {image_name:image_tag}`

### Connecting to Container Commands
`docker attach {container_id}` - connects to container. if using exit to disconnect from container, **will** power off container
`docker exec -ti {container_id} bash` - connects to container + specifies shell. if using exit to disconnect from container, **won't** power off container

### Disconnecting Commands
`exit` - exits from a container, may or may not turn off container
`Ctrl + P` then `CTRL + Q` = exits from container without powering it off

### Turning Off and Removing Commands
`docker kill {container_id}` - turn off a container
`docker container kill $(docker ps -q)`- turn off all containers
`docker container rm {container_id}` - delete a container (must be turned off)
`docker container prune` - delete all containers (must be turned off)
`docker rmi {image_name}` - remove image


### Docker Hub Commands
`docker pull {image_name}` - pulls an image from Docker Hub
