# Docker Guide
### So, you want to learn about containers and images? This guide will give you hands on experience and explain concepts along the way. Let's first talk a little bit about what they are.
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
We now have an Ubuntu container with three additional networking packages installed. You can see through the terminal that you are now in the container! It should now say `root@{container_id}`.
Let's save this version of the container as an image so that in the future we can easily replicate this current state of our container. Let's name this image ncat (first networking package installed), combined with the tag v1.0 (first version). The next commands will be:
```
exit
docker ps -a
docker commit {container_id} ncat:v1.0
```
Let's break this down. In order to run docker commands, we must first leave the container: `exit`. Next, we run `docker ps -a` in order to view all our containers. We can see our container's id as well as name, which are necessary for the next command. `docker commit...` is the command to make an image of the container's current state.

*It is important to note three things:
    Firstly, that you can also pass in the **full container's name**. 
    Secondly, that it's not required to pass in the full **container's id**. You can pass in the first character of the id, so long as it is unique to that one container. For example, I have two containers `a2853e1d3236` and `a2567f1g3248`. I couldn't use `a2` as a shortened **container id** for either, but I could use `a28` or `a25` for the respective containers.
    Thirdly, whenever you see **{container_id}**, you may alternatively enter the **containers name**.

Next let's check our images to see if it worked:
```
docker images
```
We should see not only our previously pulled images, `Ubuntu` and `Alpine`, but also our newly created `ncat:v1.0`. 

Next, let's play with different ways to start, connect to, and exit a container. First let's start our container up, and then connect to it using:
```
docker start -ti {container_id}
docker attach {container_id}
```
There is an alternative to `attach` that will also allow you to connect to a running container, while also enabling you to specify the shell you want:
```
docker exec -ti {container_id} bash
```
Now let's see about cleanup. We want to disconnect from the container, stop it from running, and ultimately delete it. (If `Ctrl + P then Ctrl + Q` doesn't work, you can use `exit`.)
```
Ctrl + P then Ctrl + Q
docker kill {container_id}
docker rm {container_id}
```
*Note: If you used `exit` to disconnect from the container, you might find that the container is no longer running! This is likely due to the fact that you used `attach` to connect to the container. In this case, skip the `docker kill` step. If you had used `exec`, and then `exit`, you'd find the container still running.

We've lost our first container! No worries, we still have an image of it, let's use that image to recreate it. It will look very similar to our first command we used to create the container, with one exception; the image name will be our new image, instead of `ubuntu`:
```
docker run -ti ncat:v1.0
```
Now lets run a command to check if one of our previously installed packages (that differentiates this image from the `ubuntu` image is) is still there:
```
ncat --version
```
Et Voila! It should return the version of ncat, indicating your progress in building a custom image. Let's disconnect from this container and remove the ubuntu image, since we don't need it anymore.
```
exit
docker rmi ubuntu
```

Congratulations! You've finished this guide on how to create and remove containers and images. If you'd like to learn more, feel free to check the `[Networking](https://github.com/SrKoDes/scripts/blob/main/docker/docker_networking.md)` guide which teaches how to get containers to speak to each other, as well as the list of [`Commands`](https://github.com/SrKoDes/scripts/blob/main/docker/docker_commands.md).



