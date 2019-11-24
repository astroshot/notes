# 在线上机器和本机互传文件

## 上传

```bash
scp localfile target_machine:target_path
```

example:

```bash
scp ./filename.txt server.com:~/Files/
```

## 下载

```bash
scp target_machine:target_file local_path
```

example:

```bash
scp server.com:~/Files/filename.txt ~/files/
```
