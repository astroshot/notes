# git 多账号配置

## 配置密钥

按邮箱生成密钥

```bash
ssh-keygen -t rsa -f ~/.ssh/id_rsa_your_custom_name -C "your email"
```

添加密钥

```bash
ssh-add ~/.ssh/id_rsa_your_custom_name
```

编辑 `~/.ssh/config` 文件，添加如下内容：

```text
Host github.com
    HostName github.com
    User Your_Custom_name
    IdentityFile ~/.ssh/id_rsa_your_custom_name
```

## 配置用户信息

cd 到项目的根目录，查看 git 配置：

```bash
git config --list
```

看一下 `user.name` 和 `user.email` 是否和希望上传的账号匹配，否则使用如下命令进行修改：

```bash
git config user.email "your@email.com"
git config user.name "your name"
```
