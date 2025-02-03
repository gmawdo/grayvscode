# Gray VS Code Server
A docker wrap of vscode server that auto connects to a graymamba NFS with irrutable audit and proof system

## Run on the graymamba docker network in order to connect with the graymamba NFS share

```bash
docker buildx build --platform linux/amd64 -t grayvscode:v1.0.0 .
docker run -d -p 8080:8080 --rm --privileged --network graymamba-network --platform linux/amd64 grayvscode:v1.0.0
```
## Todo
Add some vscode language extensions to make the environment more interesting and able to try workloads
- Rust support
- C support
- LLVM

Perhaps onboard a chosen theme setting at startup

Investigate whether we can take control of the open folder flow and use it to trigger the mount for a specific user,
rather then the mount being being built in at launch. In the kubernetes environment we have historically cloned
the pod definition and luanched the container for a specific user derive after authentication.
