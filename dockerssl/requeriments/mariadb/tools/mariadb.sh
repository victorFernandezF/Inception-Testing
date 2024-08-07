#!/bin/bash
service mysql start || { echo "MariaDB no pudo iniciar"; exit 1; }

# Comandos adicionales aquí, si los hay
tail -f /dev/null