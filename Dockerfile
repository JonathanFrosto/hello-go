FROM golang as build
WORKDIR /go/src
COPY hello.go .
RUN go build hello.go

FROM scratch
COPY --from=build /go/src/hello /
ENTRYPOINT [ "/hello" ]