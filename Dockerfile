FROM golang:1.22

WORKDIR /usr/src/app

ADD tracker.db ./

COPY go.mod go.sum ./

RUN go mod download

COPY *.go ./

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /parcel

CMD ["/parcel"]
