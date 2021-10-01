# Docker Guide
### So, you want to learn about containers and images? Let's first talk a little bit about what they are.
### A *container* is a standard unit of software that packages up code for whatever application you want to run/test. Now you could run the an application directly on your computer, or remotely on a server, but using a container takes a sleeker, more flexible approach, requiring less system resources while also being able to operate on a breadth of operating systems.
### An *image* can be thought of as a sort of blueprint. A container is just a unit of software that is able to host code, but if you want to save what a container full of code looks like, you take an image of that container. From that image, you can build duplicate containers with ease.
### Now let's get right into it. Download docker, and follow the steps below!
![docker](https://user-images.githubusercontent.com/84875113/135682938-67313527-093b-4efb-a046-0cb49c641929.png)

Let's get some docker images. In the terminal run:
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



