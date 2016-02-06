docker-bind slave for odin and another
------------

Docker bind server generic image source. This is based on `debian` image.

Image
-----

You can `pull` a ready to use image from Docker
[index](https://quay.cmer.fr/repository/cmer/slave-dns) running:

```
$ docker pull quay.cmer.fr/repository/cmer/slave-dns
```

Or build this repository:

```
$ git clone https://git.cmer.fr/cmer/slave-dns.git
$ cd slave-dns/
$ docker build -t slave-dns .
```

Container
---------

This image uses volumes and environment variables to control the bind server
configuration.

Environement:

Usage for Odin (Plesk):
---------
```
$ docker.io run --name bind -p <ip-address>:53:53 -p <ip-address>:53:53/udp <ip-address>:953:953 -d \
-e DNS_IP_MASTER=<your_Odin_IP> -e RNDC_KEY=<your_rndc_key> \
-v /etc/localtime:/etc/localtime:ro \
-t quay.cmer.fr/repository/cmer/slave-dns:latest
```
* `DNS_IP_MASTER`: ip your odin master server
* `RNDC_KEY`: Your key rndc


Shell access:

```
$ docker.io run -p <ip-address>:53:53 -p <ip-address>:53:53/udp -p <ip-address>:953:953 -i \
-v `pwd`/volumes/etc:/etc/bind -v /etc/localtime:/etc/localtime:ro \
-t quay.cmer.fr/repository/cmer/slave-dns /bin/bash
```

The command above will start a container give you a shell. Don't
forget to start the service running the `dns-start` script.

The command above will start a container and return its ID.