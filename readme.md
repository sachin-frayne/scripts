# scripts
a collection of scripts

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

### first run

```
./mac.sh
```

### updates

the first run will setup an alias called `mac`

```
mac
```
