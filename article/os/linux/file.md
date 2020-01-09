# Linux

## 匿名映射

使用映射区完成文件的读写十分方便，父子进程间通信也容易，但缺陷是每次创建映射区一定要依赖一个文件才能实现。通常为了创建映射区要 open 一个 temp 文件，创建好了再进行 unlink、close，这样比较麻烦，可以直接使用匿名映射来替代。Linux 系统提供了创建匿名映射区的方法，无需依赖文件即可创建映射区，同样需要借助标志位参数 flags 来指定。使用 `MAP_ANONYMOUS`(or `MAP_ANON`) 如：

```c
int *p = mmap(NULL, 4, PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, -1, 0);
```

4 是举例表明该位置表大小，可依据实际需要填写。

需要注意的是 `MAP_ANONYMOUS` 是 Linux 操作系统特有的宏，在类 Unix 系统中如果没有该宏的定义，可使用如下两步完成匿名映射区的建立：

```c
fd = open("/dev/zero", O_RDWR);
p = mmap(NULL, 4, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
```
