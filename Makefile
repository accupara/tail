default:	test

test:	*.go
	GOPATH=~/as/logyard go test -v

fmt:
	go fmt .