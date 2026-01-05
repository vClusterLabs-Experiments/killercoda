Step 5 — Verify independent access

Now that both services are exposed (NodePort or port-forward), access them to prove they are independent.

If you used port-forward:

- `curl -s http://localhost:18080 | head -n 1`{{exec}}

- `curl -s http://localhost:28080 | head -n 1`{{exec}}

If NodePort was used, use the node IP and corresponding NodePort shown in step 4.
