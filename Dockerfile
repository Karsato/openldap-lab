FROM debian:bookworm-slim

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    slapd ldap-utils && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 389

ENTRYPOINT ["/entrypoint.sh"]

# El comando se mantiene igual, pero ahora el entrypoint asegura que existan los archivos
CMD ["slapd", "-d", "stats", "-h", "ldap:/// ldapi:///", "-F", "/etc/ldap/slapd.d", "-g", "openldap", "-u", "openldap"]
