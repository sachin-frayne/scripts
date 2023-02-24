# scripts
a collection of scripts

put this repo in `~/Documents` for scripts to run correctly

## elastic stack download scripts

### downloading either kibana or elasticsearch will download both

```
./download_elastic_stack.sh -v 8.1.3 -s elasticsearch
```

### other components in isolation

```
./download_elastic_stack.sh -v 8.1.3 -s filebeat
```

## macos

setup mac with software, aliases, tools and extensions

### first run

```
./mac.sh
```

### updates

the first run will also setup an alias called `mac` to run from anywhere

```
mac
```
