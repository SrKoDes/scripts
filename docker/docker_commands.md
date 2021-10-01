## Docker Guide


After installing Docker, let's get some docker images. In the terminal run:
```
docker pull ubuntu
docker pull alpine:latest
```
Now we want to create a container using one of our images. Let's use our Ubuntu image, which will create a container with Ubuntu installed:
```
docker run -ti ubuntu bash
```

This Ubuntu is bare bones at the moment. Let's fix that and install some packages:
```
apt update
apt install -y ncat iputils-ping net-tools
```
We now have an Ubuntu container with three additional networking packages installed. Let's save this version of the container as an image so that in the future we can easily replicate this current state of our container. Let's name this container ubuntu-networking

Docker restarting and reentering a container (if you exit, container will still run)
```
docker start -ti {container_name}
`docker exec -ti {container_name} bash` -attaches to container + specifies shell
```

# Finding Newtork Data
`docker ps` to find container ID
`docker inspect {container ID}` to view Network info

## Finding Container Info
`docker ps` or `docker ps -a` for not running container

`docker container rm {container id}` first couple of letters

`docker kill container id` stops a running container

`docker container kill $(docker ps -q)`-kill all containers

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

`check /etc/resolv.conf` has teh local dns ---- maybe



