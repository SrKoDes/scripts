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




![Screen Shot 2021-10-13 at 6 49 18 PM](https://user-images.githubusercontent.com/84875113/137223200-2735d55e-5405-4617-91ab-384071822cd2.png)
