# Minimal Docker HTTP server image in Go

Purpose of this repo is to answer the question, _how small can minimal HTTP server be?_

## Show me

Build image:

```bash
$ just build
Sending build context to Docker daemon  22.02kB
Step 1/8 : FROM golang:1.15-buster as build-env
 ---> 4a581cd6feb1
...
```

Run image in container:

```bash
$ just run
docker run --rm -p 8080:8080 distroless-go
```

Does it work?

```bash
$ http :8080
HTTP/1.1 200 OK
Content-Length: 14
Content-Type: text/html; charset=utf-8
Date: Tue, 03 Nov 2020 06:33:33 GMT

<h1>Hello</h1>
```

And the answer is...

```bash
$ docker image ls | grep distroless-go
distroless-go              latest              1aa313d36a15        5 minutes ago        8.18MB
```
