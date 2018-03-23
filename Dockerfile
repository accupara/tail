FROM golang

RUN mkdir -p $GOPATH/src/github.com/accupara/tail/
ADD . $GOPATH/src/github.com/accupara/tail/

# expecting to fetch dependencies successfully.
RUN go get -v github.com/accupara/tail

# expecting to run the test successfully.
RUN go test -v github.com/accupara/tail

# expecting to install successfully
RUN go install -v github.com/accupara/tail
RUN go install -v github.com/accupara/tail/cmd/gotail

RUN $GOPATH/bin/gotail -h || true

ENV PATH $GOPATH/bin:$PATH
CMD ["gotail"]
