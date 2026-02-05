#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

BACKUP_DIR="$HOME/Documents"
mkdir -p "$BACKUP_DIR" # Ensure the directory exists

echo "Parando os serviços do Adventure Log..."
docker-compose stop

echo "Iniciando o backup dos volumes Docker..."

# Backup do volume do banco de dados (postgres_data)
echo "Fazendo backup do volume 'postgres_data' para $BACKUP_DIR/postgres_backup.tar..."
docker run --rm --volumes-from adventurelog-db -v "$BACKUP_DIR":/backup ubuntu bash -c "cd /var/lib/postgresql/data && tar cvf /backup/postgres_backup.tar ."

# Backup do volume de mídia (adventurelog_media)
echo "Fazendo backup do volume 'adventurelog_media' para $BACKUP_DIR/media_backup.tar..."
docker run --rm --volumes-from adventurelog-backend -v "$BACKUP_DIR":/backup ubuntu bash -c "cd /code/media && tar cvf /backup/media_backup.tar ."

echo ""
echo "Backup concluído com sucesso!"
echo "Os arquivos 'postgres_backup.tar' e 'media_backup.tar' foram criados em '$BACKUP_DIR'."
echo "Você pode agora transferir esses arquivos para a nova máquina."