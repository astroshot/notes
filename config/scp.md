# 在线上机器和本机互传文件
## 上传
```sh
scp localfile target_machine:target_path
```
example:
```sh
scp ./filename.txt server.com:~/Files/
```

## 下载
```sh
scp target_machine:target_file local_path
```
example:
```sh
scp server.com:~/Files/filename.txt ~/files/
```