# Install Python 3.7 and Python 3.6 on MacOS

## Install Python 3.7

```bash
brew install python
```

## Install Python 3.6

```bash
brew install --ignore-dependencies https://raw.githubusercontent.com/Homebrew/homebrew-core/f2a764ef944b1080be64bd88dca9a1d80130c558/Formula/python.rb
```

### Make link file

```bash
ln -s /usr/local/Cellar/python/3.6.5_1/bin/python3 /usr/local/bin/python3.6
ln -s /usr/local/Cellar/python/3.6.5_1/bin/python3 /usr/local/opt/python/bin/python3.6
```
