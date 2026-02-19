# Step 1 — Install vCluster CLI

Before we begin working with virtual clusters, let's install the vCluster CLI. This tool will allow us to create, connect to, and manage virtual Kubernetes clusters throughout the lab:

`curl -L -o vcluster "https://github.com/loft-sh/vcluster/releases/latest/download/vcluster-linux-amd64" && sudo install -c -m 0755 vcluster /usr/local/bin && rm -f vcluster`{{exec}}

Verify the installation by checking the vCluster version. This should output the installed version of vCluster.

`vcluster --version`{{exec}}

With kubectx we can check the current context to see which Kubernetes API endpoint we are using:

`kubectx`{{exec}}

You should see something like `kubernetes-admin@kubernetes` indicating you're operating on the host cluster.
