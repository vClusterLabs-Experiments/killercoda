# Welcome to vCluster 101

What is vCluster?

vCluster lets teams run virtual Kubernetes clusters on existing host clusters, giving each tenant an isolated control plane without creating separate physical clusters. It supports tenancy models from simple namespace isolation to fully dedicated nodes, GPUs, and bare metal. Environments are defined declaratively for easy, repeatable provisioning. By consolidating many virtual clusters onto fewer hosts, teams cut Kubernetes costs and simplify multi-tenant operations.

What does this lab cover?

In this lab we are going to cover most of the Quick-Start Guide (https://www.vcluster.com/docs/vcluster/) in the vCluster docs.

We will:

- Install the vCluster CLI
- Deploy a vCluster
- Inspect the vCluster
- Create a Deployment in the vCluster and view resources
- Disconnect from the vCluster and inspect the Host Cluster

We are going to keep the intro short and then move on to more customizations and more in depth options that you can use with your vCluster in the following labs. The purpose of this guide is to give you an easier option to get started with vCluster, especially if you do not currently have access to a Kubernetes Cluster.

Thanks for checking this lab out. We think vCluster is pretty cool and would love to hear from you if you have any feedback.

<img referrerpolicy="no-referrer-when-downgrade" src="https://static.scarf.sh/a.png?x-pxid=a845cc0a-5bb1-4264-807e-20b6a5db69fa" />