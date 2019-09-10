# conda usage

## Update conda

```bash
conda update --all
```

## Python virtual envs

### Create env with specified Python version

```bash
conda create -n $name python=3.x
```

### List conda virtual envs

```bash
conda env list
```

### Activation and Deactivation

```bash
source activate $name
source deactivate
```

### Install Python packages

```bash
conda install -n $name $pkg1 $pkg2 ...
```

### Remove Python packages

```bash
conda remove --name $name $pkg1 $pkg2 ...
```

### Remove virtual env

```bash
conda remove -n $name --all
```
