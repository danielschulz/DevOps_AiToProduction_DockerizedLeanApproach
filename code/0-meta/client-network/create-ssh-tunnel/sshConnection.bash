#!/usr/bin/env bash


# 1st SSH session aka the SSH tunnel
ssh \
    -L webui.docker.devops.svc.cluster.local:1206:127.0.0.1:1206 \
    -L daemon.docker.devops.svc.cluster.local:1906:127.0.0.1:1906 \
    -L iris.devops.svc.cluster.local:2008:127.0.0.1:2008 \
    -L deeplearning.devops.svc.cluster.local:2308:127.0.0.1:2308 \
    root@host.docker.devops.svc.cluster.local \
    -i /c/Apps/Current/Keys/ssh-key-8k


# ssh \
#     # Docker administrative UI (1206) & Daemon port (1906)
#     # my server's Docker Web UI listens on its port 1206 on localhost (IPv4) resp. 127.0.0.1
#     # my server's Docker Daemon listens on its port 1906 on localhost (IPv4) resp. 127.0.0.1
#     -L webui.docker.devops.svc.cluster.local:1206:127.0.0.1:1206 \
#     -L daemon.docker.devops.svc.cluster.local:1906:127.0.0.1:1906 \
#     # 2 ReST API ports
#     -L iris.devops.svc.cluster.local:2008:127.0.0.1:2008 \
#     -L deeplearning.devops.svc.cluster.local:2308:127.0.0.1:2308 \
#     # node identity for login
#     root@host.docker.devops.svc.cluster.local \
#     # secret to login with -- my private OpenSSH keyfile
#     -i /c/Apps/Current/Keys/ssh-key-8k
#
#
# line-wise pattern: [local IP/FQDN]:[local port]:[remote IP/FQDN]:[remote port]
# e.g. "deeplearning.devops.svc.cluster.local:2308:cloud.docker.devops.svc.cluster.local:2908"
#   - local FQDN: "deeplearning.devops.svc.cluster.local"
#     explanation: the SSH tunnel listens locally for all incoming request on this client's FQDN,
#     which translates into an IP (localhost, 127.0.0.1)
#   - local port: "2308"
#     explanation: the SSH tunnel listens locally for all incoming request on this client's port
#   - remote FQDN: "cloud.docker.devops.svc.cluster.local"
#     explanation: the SSH tunnel forwards all incoming request to this
#   - remote port: "2908"
#     explanation: the SSH tunnel forwards all incoming request to this
#
# Only for simplicity, all local ports on the SSH tunnel forward to the exact same ports remotely
# on the server. You may change all ports provided. As long as the chains will be kept
# aligned (not broken), everything will keep on working as before.
# The latter are the Docker Container's host ports all on the localhost network
# interface respectively. So all Containers will only be accessible through the SSH tunnel and from
# calls performed by the server itself. No inbound traffic may access them due to the
# "natural firewall" (sic) on Linux -- no IPtables, etc. needed.


# 2nd, 3rd, 4th, etc. SSH session
# establish more SSH sessions wo/ any port forwards as all those ports above will be already blocked
# more SSH sessions "only" help for convenience to work in multiple contexts/in directories at the same time
ssh \
    root@host.docker.devops.svc.cluster.local \
    -i /c/Apps/Current/Keys/ssh-key-8k
