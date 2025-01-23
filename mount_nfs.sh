#!/bin/bash

# Mount the NFS share
mount -t nfs -o nolock,tcp,rsize=131072,actimeo=120,port=2049,mountport=2049 host.docker.internal:"/dolphin's drive" /mnt/gray
