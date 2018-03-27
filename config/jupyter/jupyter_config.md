# Deploy jupyter notebook on server
## Generate jupyter config file
using
```
jupyter notebook --generate-config
```

if root is needed, then
```
jupyter notebook --generate-config --allow-config
```

## Generate password in `jupyter_notebook_config.json`
```
In [1]: from notebook.auth import passwd
In [2]: passwd()
Enter password:
Verify password:
Out[2]: 'sha1:bfd19efa9f26:95beb6e644bf1c0472def724538f6458efa9976f'
```

## Modify `jupyter_notebook_config.py`
```
c.NotebookApp.ip='*'
c.NotebookApp.password = u'sha:xxxxxx'
c.NotebookApp.open_browser = False
c.NotebookApp.port =8888
```

