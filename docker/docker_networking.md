# Docker Networking - Big question (do experiments) can two containers on two different bridge networks talk to each other?

Welcome! This guide will briefly show you how to enable two docker containers to talk to the internet, as well as each other!

***If you haven't already check out the [Intro Guide](https://github.com/SrKoDes/scripts/blob/main/docker/docker_guide.md) as well as my working [Master Commands List](https://github.com/SrKoDes/scripts/blob/main/docker/docker_commands.md)!***

### Intro

Docker has at least three pre-installed networks: `Bridge`, `Host`, and `None`. Each has a different bridge that defines its network capabilities. In this case, their driver names are the same as their network names with the exception of `None`'s driver named `Null`. Below are descriptions of each driver.
- **Bridge**: A network created by Docker to allow containers to talk to the internet as well as other containers on the same network. The default driver for any created network, if no driver is specified.
- **Host**: The container is placed on the host computer's network, i.e. your home internet.
- **Null**: The container has no networking capabilities.

For the Docker networking documentation, click [here](https://docs.docker.com/network/).

### Diving In

Let's begin by turning on Docker if you haven't already. Let's take a look at our networks. Run:
```
docker network ls
```
We should see the networks we just learned about. By default, any networks we create will have the `Bridge` driver. Let's try creating a separate network called `net01`:
```
docker network create net01
docker network ls
```
Our output should look like the image below:

<img width="449" alt="Screen Shot 2021-10-09 at 9 18 41 AM" src="https://user-images.githubusercontent.com/84875113/136659429-77f6fe43-5656-4b81-8327-5e7d7f0ecb22.png">

As you can see, our network `net01` has the `bridge` driver, meaning any container on this network should be able to connect to the internet. Let's test that out. For this, we'll need the `ncat:v1.0` image we created in the previous guide. If you don't have that image, here are steps to quickly create that image:
```
docker pull ubuntu
docker run -ti ubuntu bash

>Inside The Container
apt update
apt install -y ncat iputils-ping net-tools
exit

>Back in Host Shell
docker commit {container_id} ncat:v1.0
```
From here, let's proceed. Create a container from the `ncat:v1.0` image, with the name `server01` on the network we just created `net01`. After we've created and connected to the container, let's ping Google's primary DNS server to check for internet access:
```
docker run -ti --name server01 --net net01 ncat:v1.0 bash

>Inside the container
ping 8.8.8.8 (Ctrl + C to stop)
exit
```
*Note: If you were unable to ping the IP address, repeat the previous step in which we install networking tools onto our container.*

Let's create another container inside the same network `net01` and connect to it. Let's then find this container's IP, then exit and connect to `server01` and ping `server02`:
```
docker run -ti --name server02 --net net01 ncat:v1.0

>Inside the container
ifconfig
```

<img width="710" alt="Screen Shot 2021-10-13 at 1 48 00 PM" src="https://user-images.githubusercontent.com/84875113/137192388-4393b4f5-437e-48be-ac31-f8ba406679f9.png">


```
exit

>Back in Host Shell
docker exec -ti server01 bash

>Inside the container
ping {server02_IP_address} Ctrl + C to stop)
exit
```
*Note the box highlighted in the image above is your container's public IP address.*

As you can see, since these containers are on the same network, they can ping each other. What would happen if the containers were on different networks?

### Connecting Networks

Let's begin by creating a new container, `server03`. By not specifying the network, it will by default be placed on the `bridge` network. Let's try pinging `server02`'s IP address:
```
docker run -ti --name server03 ncat:v1.0 bash

>Inside the container
ping {server02_IP_address} (Ctrl + C to stop)
exit
```
As you can see, the ping is unsuccessful despite both containers being on networks that connect to the internet. That's because the networks aren't connected yet.

outside of the docker
`docker network connect bridge server02`- network bridge the server02 to bridge network, allowing it to ping 1st container created above
`docker exec -ti server02 bash`- re enter server02 container (and ping containers to see youre connection)

outside of the container![Uploading Screen Shot 2021-10-09 at 9.18.41 AM.png…]()

`docker run -ti -p 45678:8080 ncat:v1.0 bash`


inside new container with ports
`nc -lp 8080`- adds a port listener on 8080 (nc allows you to connect and open a port on the system you run nc on. ncat listen on port 8080)

outside
`nc localhost 45678` - CONENCT to localhost port now you can send messages between each other


`docker run -ti -p 45672:8000 ncat:v1.0 bash` - create new container with different port

inside first new container
`nc -lp 8080` - open up the port again

inside newest container
`nc {ip of the above container} 8080` - connect to that port


docker hub

`docker tag ncat:v2.0 srkodes/ncat:v3.0` - create new image


`docker inspect {container ID}` to view Network info

`check /etc/resolv.conf` has teh local dns ---- maybe
