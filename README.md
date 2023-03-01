[aguslr/docker-timelimit-server][1]
===================================

[![publish-docker-image](https://github.com/aguslr/docker-timelimit-server/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/aguslr/docker-timelimit-server/actions/workflows/docker-publish.yml) [![docker-pulls](https://img.shields.io/docker/pulls/aguslr/timelimit-server)](https://hub.docker.com/r/aguslr/timelimit-server) [![image-size](https://img.shields.io/docker/image-size/aguslr/timelimit-server/latest)](https://hub.docker.com/r/aguslr/timelimit-server)


This *Docker* image sets up *TimeLimit Server* inside a docker container.

> **[TimeLimit Server][2]** is the server for the connected mode in
> [TimeLimit][3].


Installation
------------

To use *docker-timelimit-server* with an [external database][4], follow these
steps:

1. Clone and start the container:

       docker run -p 8080:8080 \
         -e DATABASE_URL=mariadb://user:pass@example.com:3306/dbname \
         docker.io/aguslr/timelimit-server:latest

2. Connect from your *TimeLimit* app to your *TimeLimit Server*'s IP address on
   port `8080`.


Build locally
-------------

Instead of pulling the image from a remote repository, you can build it locally:

1. Clone the repository:

       git clone https://github.com/aguslr/docker-timelimit-server.git

2. Change into the newly created directory and use `docker-compose` to build and
   launch the container:

       cd docker-timelimit-server && docker-compose up --build -d


[1]: https://github.com/aguslr/docker-timelimit-server
[2]: https://codeberg.org/timelimit/timelimit-server
[3]: https://codeberg.org/timelimit/timelimit-android
[4]: https://codeberg.org/timelimit/timelimit-server/src/branch/master/docs/usage/docker.md
