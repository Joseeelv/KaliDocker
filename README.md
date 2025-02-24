# KaliDocker

He creado un contenedor de Docker que contiene una máquina Kali para poder realizar laboratorios orientados al pentesting web.

## Compilar contenedor
```bash
docker build -t <nombre>
```
## Ejecutar contenedor
```bash
docker run -it --cap-add=NET_ADMIN --device /dev/net/tun --name kali-pentest kali-pentest
```
## Parar y eliminar contenedor
```bash
docker stop <nombre> && docker rm <nombre>
```
