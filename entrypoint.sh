#!/bin/bash
set -e

# Si la carpeta de configuración está vacía, la inicializamos
if [ ! -d "/etc/ldap/slapd.d/cn=config" ]; then
  echo "Configuración no encontrada. Inicializando..."

  # 1. Definimos la contraseña antes de configurar
  echo "slapd slapd/internal/adminpw password adminpassword" | debconf-set-selections
  echo "slapd slapd/internal/adminpw_again password adminpassword" | debconf-set-selections

  # 2. Forzamos la configuración con el dominio por defecto (nodomain por ahora)
  DEBIAN_FRONTEND=noninteractive dpkg-reconfigure slapd
fi

# Ajustar permisos
chown -R openldap:openldap /etc/ldap/slapd.d
chown -R openldap:openldap /var/lib/ldap

exec "$@"
