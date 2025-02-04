# Gray VSCode Server
A docker wrap of vscode server that auto connects to a graymamba NFS with irrutable audit and proof system

## Using docker compose to run the vscode server and the NFS server
```bash
docker compose up -d
```

## Using docker compose down to stop the vscode server and the NFS server
```bash
docker compose down
```

Note when using Docker compose you will need to edit the docker-compose.yml file to set the correct user data directory for the vscode server. Basically modify lines with /Users/mawdo/GRAY/TESTDATA to the correct path for the host user data directory on your host machine.

TESTDATA is a directory that must contain:
- config/settings.toml
- RocksDBs/ (this directory can be left empty and the solution we auto generate what is necessary)
- .vscode/ (this directory can be left empty and the solution we auto generate what is necessary)

Note TESTDATA can be called whatever you like, but it must be the same in the docker-compose.yml file.

settings.toml is a file that contains the settings for the graymamba server. It is a toml file that contains the settings for the graymamba server and should look similar to this.

```
#Secret Sharing Configuration
chunk_size = 48
threshold = 2
share_amount = 3
prime = "1602647667098023157650208502760830646118971559180602279760560620305846622963164828915087516998772696148300120393034934719"
thread_number = 5

[logging]
level = "warn"
module_filter = [
    "graymamba::sharesfs::channel_buffer=debug",
    ]

[storage]
rocksdb_path = "../RocksDBs/graymamba"
auditdb_path = "../RocksDBs/audit_merkle_db"
namespace_id = "aqautics"
community = "zoo"
[nfs]
data_room_address = "127.0.0.1:2049"
```

## If you simply want to run the vscode server manually with docker you can do so with the following command.
It will expect to find an NFS in the network though!

```bash
docker buildx build --platform linux/amd64 -t grayvscode:v1.0.0 .
docker run -d -p 8080:8080 -v /Users/mawdo/GRAY/TESTDATA/.vscode:/tobe/provided/.vscode --rm --privileged --network graymamba-network --platform linux/amd64 grayvscode:v1.0.0
```

note we've allowed for the possibility of preserving .vscode settings in the provided volume