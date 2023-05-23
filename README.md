Docker image for checkbox

To build image

```
build.sh
````

Or the image can be pulled from remote hub:

```
docker pull ghcr.io/petitfou/checkbox:<version>
```
or
```
docker pull hectorcao84/checkbox:<version>
```

To run the service

```
docker run -p 18871:18871 checkbox:<version> service
```

To run the client

```
docker run -ti checkbox:<version>

-t : to allocate a pseudo-tty
-i : allow user to interact with checkbox-cli through terminal
```

By default, checkbox is installed inside the image but you can use a local source code:

```
cd checkbox
run -v ${PWD}/:/tmp/checkbox/ -it checkbox:<version> service
```

To run the service with some side-load providers:

```
run -v <provider1>:/var/tmp/checkbox-providers/<provider1> \
    -v <provider2>:/var/tmp/checkbox-providers/<provider2> \
    -it checkbox:<version> service
```