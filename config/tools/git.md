# Compile git on CentOS 6u3

## Install required packages

```bash
yum -y install zlib-devel curl-devel openssl-devel perl cpio expat-devel gettext-devel openssl zlib autoconf tk perl-ExtUtils-MakeMaker
```

## Download git source code

Open `https://mirrors.edge.kernel.org/pub/software/scm/git/` and choose git package.

## Compile git

```bash
cd /path/to/git
./configure --prefix=/usr
make
make install
```
