## Task

In this project, you will write a basic Dockerfile to create a Docker image. When this Docker image is run, it should print “Hello, Captain!” to the console before exiting.

Requirements
- The Dockerfile should be named Dockerfile.
- The Dockerfile should be in the root directory of the project.
- The base image should be alpine:latest.
- The Dockerfile should contain a single instruction to print “Hello, Captain!” to the console before exiting.


## How to use
- Install docker
- Build the image - `docker build -t basic-dockerfile .`
- Run the image - `docker run basic-dockerfile`

You can pass the name arg to the Dockerfile by `docker build -t basic-dockerfile --build-arg NAME=YourName .`