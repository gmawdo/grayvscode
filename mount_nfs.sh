#!/bin/bash

# Mount the NFS share
# Note dolphin is the hard coded NFS username and the NFS parses the name from the string "dolphin's drive"
mount -t nfs -o nolock,tcp,rsize=131072,actimeo=120,port=2049,mountport=2049 host.docker.internal:"/dolphin's drive" /mnt/gray
