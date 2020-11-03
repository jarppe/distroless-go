FROM golang:1.15-buster as build-env

WORKDIR /go/src/app
ADD . /go/src/app

RUN go get -d -v ./...

# RUN go build -o /go/bin/app
RUN CGO_ENABLED=0 GOOS=linux go build -o /go/bin/app -a -ldflags '-extldflags "-static"' .

FROM gcr.io/distroless/static
COPY --from=build-env /go/bin/app /
CMD ["/app"]
