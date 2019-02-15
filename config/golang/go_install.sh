#!/bin/sh
mkdir -p $GOPATH/src/golang.org/x
git clone https://github.com/golang/tools.git $GOPATH/src/golang.org/x/tools
git clone https://github.com/golang/lint.git $GOPATH/src/golang.org/x/lint
git clone https://github.com/golang/net.git $GOPATH/src/golang.org/x/net
git clone https://github.com:golang/sys.git $GOPATH/src/golang.org/x/sys

go get github.com/nsf/gocode
go get github.com/stamblerre/gocode
go get github.com/uudashr/gopkgs/cmd/gopkgs
go get github.com/ramya-rao-a/go-outline
go get github.com/acroca/go-symbols
go get github.com/fatih/gomodifytags
go get github.com/haya14busa/goplay/cmd/goplay
go get github.com/josharian/impl
go get github.com/davidrjenni/reftools/cmd/fillstruct
go get github.com/rogpeppe/godef
go get golang.org/x/tools/cmd/godoc
go get github.com/sqs/goreturns
go get github.com/golang/lint/golint
go get github.com/kisielk/errcheck
go get github.com/klauspost/asmfmt/cmd/asmfmt
go get github.com/alecthomas/gometalinter
go get honnef.co/go/tools/cmd/keyify
go get github.com/cweill/gotests/...

go get golang.org/x/tools/cmd/guru
go get golang.org/x/tools/cmd/gorename
go get golang.org/x/tools/cmd/goimports
curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh
