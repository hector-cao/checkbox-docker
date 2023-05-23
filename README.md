Docker image for checkbox

To build image

```
build.sh
````

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