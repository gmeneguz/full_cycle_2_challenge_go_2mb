FROM golang:1.17.5-alpine3.15 AS builder

WORKDIR /go/src/app
COPY . .

RUN go build -o main main.go

FROM scratch 

COPY --from=builder  /go/src/app /

CMD ["/main"]