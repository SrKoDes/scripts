# Intro to Docker Networking

Welcome! This guide will briefly show you how to enable two docker containers to talk to the internet, as well as each other!

***If you haven't already check out the [Intro Guide](https://github.com/SrKoDes/scripts/blob/main/docker/docker_guide.md) as well as my working [Master Commands List](https://github.com/SrKoDes/scripts/blob/main/docker/docker_commands.md)!

# Coming Soon! (Only Notes Below)


`docker run -ti ncat:v1.0 bash` - start up and enter container with ncat:v1.0 image (name is nifty_villani
`docker run -ti --name server01 --net net01 ncat:v1.0 bash` - start up and enter container named server01 in net01 with same image
`docker run -ti --name server02 --net net01 ncat:v1.0 bash`- start up and enter container named server02 in net01 with same image
`exit`- exit container

outside of the docker
`docker network connect bridge server02`- network bridge the server02 to bridge network, allowing it to ping 1st container created above
`docker exec -ti server02 bash`- re enter server02 container (and ping containers to see youre connection)

outside of the container
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
