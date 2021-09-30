# Bootstrap
In root account (windows)
```
docker pull ubuntu
docker run -ti ubuntu bash
docker pull alpine:latest
```
Then in the container->
```
apt update
apt install -y ncat iputils-ping net-tools
```

Docker restarting and reentering a container (if you exit, container will still run)
```
docker start -ti {container_name}
`docker exec -ti {container_name} bash` -attaches to container + specifies shell
```

# Finding Newtork Data
*

`docker ps` to find container ID
`docker inspect {container ID}` to view Network info

## Finding Container Info
`docker ps` or `docker ps -a` for not running container

`docker container rm container id` first couple of letters

`docker kill container id` stops a running container

`docker commit 7fef ncat:v1.0` create an image name:tag

`docker run --rm -ti ncat:v1.0 bash` rm will remove the container after we start a container from this image

`docker rmi alpine` - remove images?

`docker run -ti -d imagename:imagetag bash` -d is to run it in the background

`docker attach containerid` - logs in to the container

`ctrl + q` will exit container without closing it

`docker run -ti -v /Users/hev/test:/shared ncat:v1.0 bash` supposed to create a container with an image and a directory /shared using the directory specified by the path. this folder will mirror local files both ways.

`docker container prune` - delete all containers (must all be stopped)

`docker network ls` - view network

`docker network create {name}` - create network

`docker run -ti --net {containername} --name {servername} ncat:v1.0 bash` - 

ifconfig

`docker run --rm -ti ncat:v1.0 bash`

ifconfig



two containers cant communicate with each other, because first is on default and the second is on private

`docker run --rm --name {containername} --net {networkname} -ti ncat:v1.0 bash`

check /etc/resolv.conf has teh local dns ---- maybe



