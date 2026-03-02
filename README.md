# OpenLDAP-lab
Levanta dos contenedores para trastear con LDAP.

Configura dos contenedores usando docker, uno para OpenLDAP y otro para phpLDAPadmin.


## Configuración inicial
```bash
./setup.sh
source ~/.bashrc
```


## Iniciar el laboratorio desde cero
```bash
just ldap-clean
just ldap-up
just ldap-config
just ldap-restart
```


## Inicio normal
```bash
just ldap-up
```


## Administrar LDAP
[phpLDAPadmin (http://localhost:8080/)](http://localhost:8080/)

También se puede administrar por consola entrando con docker exec.
```bash
docker exec -it servidor-ldap-debian bash
```


## Búsquedas
```bash
just ldap-search "dc=practica,dc=local"
```



## Pixi y Just
Este proyecto instala pixi (en el usuario local en ~/.pixi) y just (para automatizar).

Pixi es una herramienta basada en el ecosistema de conda para gestionar paquetes y entornos. Permite instalar binarios y paquetes sin permisos en el usuario local, todo aquello que esté en el repositorio conda-forge.

Just es un "command runner" que te permite organizar tus comandos y scripts. Es políglota y multiplataforma.
Crear recetas en Just es muy sencillo, te permite ocultar la complejidad de algunas tareas agrupando los comandos en recetas. Puedes hacer que se ejecuten recetas previas, al estilo dependencias de make, para poder preparar tu entorno para la tarea que quieres ejecutar. 

La combinación de pixi y just me parece perfecta para gestionar y automatizar tareas, tanto en entornos en los que tenemos sudo como en los que no.
