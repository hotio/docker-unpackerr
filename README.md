[<img src="https://hotio.dev/img/unpackerr.png" alt="logo" height="130" width="130">](https://github.com/davidnewhall/unpackerr)

[![GitHub Source](https://img.shields.io/badge/github-source-ffb64c?style=flat-square&logo=github&logoColor=white&labelColor=757575)](https://github.com/hotio/unpackerr)
[![GitHub Registry](https://img.shields.io/badge/github-registry-ffb64c?style=flat-square&logo=github&logoColor=white&labelColor=757575)](https://github.com/orgs/hotio/packages/container/package/unpackerr)
[![Docker Pulls](https://img.shields.io/docker/pulls/hotio/unpackerr?color=ffb64c&style=flat-square&label=pulls&logo=docker&logoColor=white&labelColor=757575)](https://hub.docker.com/r/hotio/unpackerr)
[![Discord](https://img.shields.io/discord/610068305893523457?style=flat-square&color=ffb64c&label=discord&logo=discord&logoColor=white&labelColor=757575)](https://hotio.dev/discord)
[![Upstream](https://img.shields.io/badge/upstream-project-ffb64c?style=flat-square&labelColor=757575)](https://github.com/davidnewhall/unpackerr)
[![Website](https://img.shields.io/badge/website-hotio.dev-ffb64c?style=flat-square&labelColor=757575)](https://hotio.dev/containers/unpackerr)

## Starting the container

CLI:

```shell
docker run --rm \
    --name unpackerr \
    -e PUID=1000 \
    -e PGID=1000 \
    -e UMASK=002 \
    -e TZ="Etc/UTC" \
    -v /<host_folder_config>:/config \
    hotio/unpackerr
```

Compose:

```yaml
version: "3.7"

services:
  unpackerr:
    container_name: unpackerr
    image: hotio/unpackerr
    environment:
      - PUID=1000
      - PGID=1000
      - UMASK=002
      - TZ=Etc/UTC
    volumes:
      - /<host_folder_config>:/config
```

## Tags

Go [here](https://hotio.dev/tags-overview/#hotiounpackerr) to see all available tags.

## Configuration

You can use docker environment variables or a configuration file that should be stored in `/config/app/unpackerr.conf`. Don't forget to mount your volume where Unpackerr should look to find your downloads. Take a look at the [upstream](https://github.com/davidnewhall/unpackerr) project page for info on how to configure Unpackerr.
