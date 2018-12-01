#!/bin/sh
go get github.com/nsf/gocode
go get github.com/uudashr/gopkgs/cmd/gopkgs
go get github.com/ramya-rao-a/go-outline
go get github.com/acroca/go-symbols
go get golang.org/x/tools/cmd/guru
go get golang.org/x/tools/cmd/gorename
go get github.com/fatih/gomodifytags
go get github.com/haya14busa/goplay/cmd/goplay
go get github.com/josharian/impl
go get github.com/davidrjenni/reftools/cmd/fillstruct
go get github.com/rogpeppe/godef
go get golang.org/x/tools/cmd/godoc
go get github.com/sqs/goreturns
go get github.com/golang/lint/golint
go get github.com/cweill/gotests/...
curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh
