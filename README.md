Simple docker image that packages the [ventoy](https://www.ventoy.net) program.

https://github.com/nathanejohnson/ventoy-docker

To run this and expose a device /dev/sdc, simply:

    docker run --device /dev/sdc --rm -it -p 24680:24680 nathanejohnson/ventoy:latest

And then you'd point your browser to http://localhost:24680 , or the ip of your docker host if connecting remotely.

If you'd prefer to use the cli, you could instead do the same as above, but override the command like so

    docker run --device /dev/sdc --rm -it -p 24680:24680 nathanejohnson/ventoy:latest /bin/bash


You can build this locally by simply running make, and it will build an image tagged as ventoy:latest as well as ventoy:&lt;ventoy version number>