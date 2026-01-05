```markdown
# Step 4 — Verify independent access

Now let's verify that both `my-app` instances are running independently. We'll test connectivity to each via the port-forwards we set up.

In one terminal, verify that `my-app` in vCluster-a is accessible on port 18080:

`curl http://localhost:18080`{{exec}}

You should see the nginx welcome page HTML.

In another terminal, verify that `my-app` in vCluster-b is accessible on port 28080:

`curl http://localhost:28080`{{exec}}

Again, you should see the nginx welcome page.

Both instances respond identically because they're running the same container image, but they are completely independent — deployed, scheduled, and managed separately by each vCluster's control plane.

If you used NodePort instead of port-forward, check each vCluster's node IP and assigned NodePort to verify access similarly.

```
