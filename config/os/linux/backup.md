# Backup and Restore Linux System

## Backup

```bash
sudo tar cvpzf /run/media/ezio/Scopinok/bak/manjaro/snapshot-20190616.tgz / --exclude=/proc --exclude=/lost+found --exclude=/tmp --exclude=/sys --exclude=/media --exclude=/home --exclude=/mnt --warning=no-file-change
```

## Restore

Be aware that files aleady exist in path `/` will not be removed.

```bash
sudo tar xvpzf backup.tgz -C /
```
