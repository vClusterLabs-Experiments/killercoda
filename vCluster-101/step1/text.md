# Install vCluster CLI

To install vCluster CLI, run the following command:

`curl -L -o vcluster "https://github.com/loft-sh/vcluster/releases/latest/download/vcluster-linux-amd64" && sudo install -c -m 0755 vcluster /usr/local/bin && rm -f vcluster`{{exec}}

Verify the installation by checking the vCluster version. This should output the installed version of vCluster.

`vcluster --version`{{exec}}

With kubectx we can check the current context to see which Kubernetes API endpoint we are using:

`kubectx`{{exec}}

You should see something like `kubernetes-admin@kubernetes` indicating you’re operating on the host cluster.
