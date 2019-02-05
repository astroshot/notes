# MacOS

## Write Protect File From Command Line

### Change File Flags With the chflags Command

The chflags command modifies the file flags. First, open the terminal and to set system immutable flag type the following command:

```bash
sudo chflags schg fileName
```

The owner can set the user immutable flag as follows (no need to use sudo or superuser password):

```bash
chflags uchg fileName
```

In this, example set user immutable flag on resume.txt file, enter:

```bash
chflags uchg resume.txt
```

To list flags, enter:

```bash
ls -lO resume.txt
```

Sample outputs:

```bash
-rw-r--r--  1 vivek  wheel  uchg 18424 Jun  2 18:48 resume.txt
```

Now, try deleting or writing to the same file, enter:

```bash
rm resume.txt
```

Sample outputs:

```bash
override rw-r--r--  vivek/wheel uchg for resume.txt? y
rm: resume.txt: Operation not permitted
```

### How Do I Remove User Immutable Flag?

Use the command as follows:

```bash
chflags nouchg resume.txt
ls -lO resume.txt
```

Sample outputs:

```bash
-rw-r--r--  1 vivek  wheel  - 18424 Jun  2 18:48 resume.txt
```

Putting the letters no before causes the flag to be cleared.

### How Do I Remove System Immutable Flag?

Use the command as follows:

```bash
sudo chflags noschg resume.txt
ls -lO resume.txt<
```

Please note that above commands works on both the file and folder (remember, under UNIX everything is file).
