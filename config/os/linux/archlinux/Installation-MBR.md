# Archlinux Installation based on BIOS/MBR

## 1 安装准备

下载 archlinux 安装镜像，并刻录到 U 盘，windows 可以用 Etcher 刻录，Linux 系统可以直接用命令刻录：

```bash
dd if=archlinux.iso of=/dev/sdx bs=512k
```

## 2 进入 Live 系统

安装 Archlinux 需要联网，如果是有线网并且路由器支持 DHCP，插上网线后执行 `dhcpcd` 获取 IP 地址。

更新系统时间：

```bash
timedatectl set-ntp true
```

## 3 分区

查看磁盘：

```bash
fdisk -l
```

选择磁盘，创建 MBR 分区，将 `sdx` 更改为自己的磁盘，如 `sda`, `sdb` ...

```bash
fdisk /dev/sdx
```

我个人习惯分三个区：`/boot`, `/`, `/home`

1. 输入 `n` 创建一个新的分区，首先输入起始扇区，选择默认就好，然后输入分区大小，这里输入 `+512m` 创建引导分区;
2. 输入 `n` 创建第二个分区，选择默认起始扇区，输入 `+20g`;
3. 输入 `n` 创建第三个分区，选择默认起始扇区，直接回车使用默认大小;

输入 `w` 将分区的改动写入磁盘，并执行格式化。注意引导分区要格式化成 FAT32 的格式。

```bash
mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda2
mkfs.ext4 /dev/sda3
```

## 4 安装

挂载分区：

```bash
mount /dev/sda2 /mnt
mkdir /mnt/boot /mnt/home
mount /dev/sda1 /mnt/boot
mount /dev/sda3 /mnt/home
```

选择镜像源：

```bash
vim /etc/pacman.d/mirrorlist
```

或者手动输入（这里选择了清华的镜像）

```bash
Server = http://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch
```

接下来安装基本的组件：

```bash
pacstrap /mnt base base-devel linux-lts414 dhcpcd
```

这里选择的 linux 内核版本是 4.14 LTS 版，想安装其他版本的内核只需要改下名称（`linux`, `linux-lts`），例如 linux 表示最新版本的内核，linux-lts 表示最新版本的 LTS 版内核。这一步需要等下载完成后安装。

## 5 配置

### 5.1 配置 fstab

执行下面的命令，生成自动挂载分区的 fstab 文件：

```bash
genfstab -L /mnt >> /mnt/etc/fstab
```

检查生成的文件是否正确：

```bash
cat /mnt/etc/fstab
```

## 5.2 配置系统

```bash
arch-chroot /mnt
```

如果系统出现问题，只要插入 U 盘启动，然后将系统根分区挂载到 `/mnt` 下，再通过命令即可进行修复。

### 设置时区

```bash
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc
```

### 安装必须的软件包

```bash
pacman -S vim dialog wpa_supplicant ntfs-3g networkmanager
```

### 设置 locale

```bash
vim /etc/locale.gen
```

设置 `en_US.UTF-8` 然后执行 `locale-gen`。

```bash
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo $hostname >> /etc/hostname
```

### 设置 hosts

编辑 `/etc/hosts`，加入

```text
127.0.0.1 localhost
::1 localhost
```

### 设置 root 密码

```bash
passwd
```

### 安装 intel-ucode

非 intel CPU 跳过

```bash
pacman -S intel-ucode
```

### 配置 boot

```bash
pacman -S os-prober ntfs-3g grub
```

部署 grub：

```bash
grub-install --target=i386-pc /dev/sdx
```

生成配置文件：

```bash
grub-mkconfig -o /boot/grub/grub.cfg
```

### 重启

```bash
exit
reboot
```
