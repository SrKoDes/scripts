### Clusters

`k3d cluster list` - Lists all clusters

`k3d cluster create {name}` - Creates a cluster with name `{name}`. If no name is specified, it creates the default cluster

`kubectl config get-contexts {cluster_name}` - Gives info on clusters. Tells you which you're currently connected to (denoted by "\*" under "Current"). `{name}` is optional and will give you info on the specific cluster

`kubectl config use-context {cluster_name}` - Allows you to switch connection to the designated cluster

`kubectl get all` - Shows information on clusters

`k3d cluster edit cluster-name --port-add "{port}:{port}@loadbalancer"` - Will edit the cluster. In this case it is adding a port to the loadbalancer

`k3d cluster delete {cluster_name}` - Deletes a specified cluster

**Options**

`-p "{localhost_port}:{container_port}@loadbalancer" ` - When used with `k3d cluster create`, will open a port on the cluster's loadbalancer

### Nodes

`k3d node list` - Lists all nodes

`k3d node create {agent_name} -c {cluster_name}` - Creates agent in specified cluster

`kubectl get node` - Shows info on a node (maybe the master node)

### Deployments

`kubectl create -f {file_name}.yml` - Create a deployment

`kubectl get all` - Shows info on the deployment 

`kubectl expose deployment {app_name(from yml file)-deployment} --port 8080 --target-port 80 --type=LoadBalancer` - Expose ports on a deployment. go on local host:8081 after and it works (can be included in yml file)


### .yml File

```
# Helloworld application- just the deployment
apiVersion: apps/v1
kind: Deployment
metadata:
  name: # name of the deployment
spec:
  selector:
    matchLabels:
      app: helloworld
  replicas: # tells deployment how many pods to run
  template: # create pods using pod definition in this template
    metadata:
      labels:
        app: # name of the app
    spec:
      containers:
      - name: helloworld
        image: karthequian/helloworld:latest
        ports:
        - containerPort: 80
```


![Screen Shot 2021-10-13 at 6 49 18 PM](https://user-images.githubusercontent.com/84875113/137223200-2735d55e-5405-4617-91ab-384071822cd2.png)


