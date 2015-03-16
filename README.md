`vagrant up`
`vagrant ssh`

`chmod 744 share/docker/run.sh`
`chmod 744 share/docker/build.sh`

Interactive
`share/docker/build.sh`
Non-interactive
`share/docker/build.sh grunt`

Interactive
`share/docker/run.sh`
Non-interactive
`share/docker/build.sh grunt project_root`

Other commands
`docker ps`
`docker stop [name]`
`docker start [name]`
`docker exec -it [name] /bin/bash`