# Horovod Cluster example

Autori:
 - Luca Gregori
 - Alessandro Wood

## Prerequisiti
- [docker](https://www.docker.com/)
- [nvidia-docker](https://github.com/NVIDIA/nvidia-docker): Abilita l'uso della scheda video per i container docker.
Guida all'installazione al seguente [link](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker).

## Setup Horovod cluster

### Inizializzazione chiavi SSH
Lo script ```init-ssh.sh``` crea le chiavi SSH necessarie all'autenticazione tra i nodi del cluster senza prompt.
```shell
chmod +x init-ssh.sh
./init-ssh.sh
```

### Inizializzazione cluster (3 nodi)

```
docker compose up
```

#### All'interno del file ```docker-compose.yml```:

```
horovodrun -np 3 -H horovod-master:1,horovod-worker-1:1,horovod-worker-2:1 -p 12345 python /horovod/examples/pytorch/pytorch_mnist.py
```
dove ```-np 3``` indica il numero di processi totali, e ```horovod-master:1,horovod-worker-1:1,horovod-worker-2:1``` la lista dei nodi del cluster (```nome-cluster:num_proc```).

---

```
volumes:
      - ./tmp/.ssh/:/root/.ssh
```
mapping della cartella ```.ssh``` per installare le chiavi SSH dentro ogni nodo del cluster.