# k3d

k3s is the lightweight Kubernetes distribution by Rancher: rancher/k3s

k3d creates containerized k3s clusters. This means, that you can spin up a multi-node k3s cluster on a single machine using docker.




`k3d cluster list` - lists all clusters

`k3d cluster create {name}` - creates a cluster with name `{name}`

`k3d cluster list` - see the cluster is created

`k3d node create {agent_name} -c {cluster_name}` - creates agent in cluster

`k3d cluster list` - lists all clusters ( you can see the agent exists in the cluster now.

`k3d node list` - lists your nodes (see the nodes you and your cluster created)

`kubectl config get-contexts {cluster_name}` - gives more info on clusters. tells you which youre currently connected to (denoted by "\*" under Current). `{name}` is optional and will give you the specific cluster

`kubectl config use-context {cluster_name}` - allows you to switch to the designated cluster

`kubectl get all` - shows information on the current cluster

`k3d cluster delete {cluster_name}` - deletes a cluster

`k3d cluster create {cluster_name} -p "8081:8080@loadbalancer" ` - create a cluster with a port open on a loadbalancer

`kubectl get node` - shows info on a node (maybe the master node)

create a hello-world.yml file in a directory of your choosing.

`nano hello-world.yml`

Breaking down a yml file: 
### if you want Tyrone's copy, get it from the zoom chat
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

`kubectl create -f {file_name}.yml` - create a deployment

`kubectl get all` - info on the deployment

`kubectl expose deployment {app_name(from yml file)-deployment} --port 8080 --target-port 80 --type=LoadBalancer` - expose ports on a deployment. go on local host:8081 after and it works


`k3d cluster edit cluster-name --port-add "{port}:{port}@loadbalancer"`
