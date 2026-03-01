mod ldap ".ldap.just"

@help-practica:
  echo "Práctica de OpenLDAP"
  just -l 
  just -l ldap

# Procesos 
procesos:
  docker compose ps


# comprueba si el servidor ldap está en servicio
ldap-alive:
  #docker exec servidor-ldap ldapsearch -x -H ldap://localhost -b "dc=practica,dc=local" -D "cn=admin,dc=practica,dc=local" -w adminpassword
  docker exec servidor-ldap-debian ldapsearch -x -H ldap://localhost -b "dc=nodomain"


# Muestra los logs del servidor ldap
ldap-logs:
  docker logs servidor-ldap


# Para los procesos
ldap-down:
  docker compose down


# Arrancar todo:
ldap-up:
  docker compose up -d

# Configurar ldap (Una vez al inicio)
# Configurar OpenLDAP
ldap-config:
  docker exec -it servidor-ldap-debian dpkg-reconfigure slapd

# Limpiar todo para iniciar desde cero
ldap-clean:
	docker compose down -v
	sudo rm -rf ./config/* ./data/*
	# Opcional: si quieres forzar el borrado de la imagen creada por el Dockerfile
	docker rmi 2026_openldap-openldap


# Reinicia openldap. Es conveniente después de cambiar alguna configuración.
ldap-restart:
  docker compose restart openldap
  docker exec servidor-ldap-debian ldapsearch -x -H ldap://localhost -b "dc=practica,dc=local"

