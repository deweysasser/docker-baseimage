# docker-baseimage
A base image for docker, like phusion/baseimage but without their defaults

## Using

Inherit from this container, place scripts in /etc/startup and/or /etc/run and they will be run

## Directories

* /etc/runonce -- any executables placed here will be run *exactly once* per container (state tracked in /var/lib/runonce)
* /etc/startup -- any executables placed here will be invoked *once* on container startup (each time)
* /etc/run -- any executables here will be run as a runit service (by coping to the appropriate directory)
* /var/lib/runonce -- a directory to track what (from /etc/runonce) has already been run
