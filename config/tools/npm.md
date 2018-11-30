# npm config

使用系统 npm 目录会报权限错误，建议使用自定义的目录。

```bash
export NODE_PATH="$NODE_PATH:$HOME/.local/npm/lib/node_modules"
export PATH=$HOME/.local/npm/bin:$PATH
```

由于npm 安装太慢，所以使用cnmp。

```bash
npm install -g cnpm --registry=https://registry.npm.taobao.org
npm config set registry https://registry.npm.taobao.org
```

使用cnmp安装react

```bash
cnpm install -g create-react-app
create-react-app my-app
cd my-app/
npm start
```

