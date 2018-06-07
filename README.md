# musvc

This project is aimed at those who wish to start writing a microservice in Haskell.

## How to build

``` shell
stack install
```

`musvc` is a static binary which provides a microservice. It can be found under `./bin`.

## How to run

- Build the docker image

```shell
docker build -t musvc .
```

- Run your microservice

``` shell
docker run -p 9001:9001 -it musvc musvc --port 9001
```
