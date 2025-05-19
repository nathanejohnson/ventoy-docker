Simple docker image that packages [ventoy](https://www.ventoy.net) program.

https://github.com/nathanejohnson/ventoy-docker

To run this and expose a device /dev/sdc, simply:

    docker run --device /dev/sdc --rm -it -p 24680:24680 nathanejohnson/ventoy:latest

And then you'd point your browser to http://localhost:24680 , or the ip of your docker host if connecting remotely.