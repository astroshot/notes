# 修复 WSL 子系统文件权限

## 创建 wsl.conf 文件

```sh
$ vim /etc/wsl.conf
```

写入

```text
[automount]
enabled = true
root = /mnt/
options = "metadata,umask=22,fmask=11"
mountFsTab = false
```

## 配置 bashrc 或者 zshrc

```sh
if [ "$(umask)" = "0000" ]; then
  umask 0022
fi
```

> 参考[文章](https://www.turek.dev/post/fix-wsl-file-permissions/)