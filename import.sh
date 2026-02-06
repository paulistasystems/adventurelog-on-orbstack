#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

BACKUP_DIR="$HOME/Documents"

# Verifica se os arquivos de backup existem
if [ ! -f "$BACKUP_DIR/postgres_backup.tar" ] || [ ! -f "$BACKUP_DIR/media_backup.tar" ]; then
    echo "Erro: Arquivos de backup '$BACKUP_DIR/postgres_backup.tar' e/ou '$BACKUP_DIR/media_backup.tar' não encontrados."
    echo "Certifique-se de que os arquivos de backup estão no diretório: $BACKUP_DIR"
    exit 1
fi

echo "Iniciando o processo de importação..."

echo "Passo 1: Parando containers existentes e removendo volumes..."
docker-compose down -v 2>/dev/null || true

echo "Passo 2: Criando os volumes (sem iniciar os containers)..."
docker-compose create db server

echo "Passo 3: Restaurando os dados a partir dos backups..."

# Restauração do banco de dados - ANTES do Postgres inicializar
echo "Restaurando o volume 'postgres_data' a partir de $BACKUP_DIR/postgres_backup.tar..."
docker run --rm --volumes-from adventurelog-db -v "$BACKUP_DIR":/backup ubuntu bash -c "cd /var/lib/postgresql/data && tar xvf /backup/postgres_backup.tar"

# Restauração dos arquivos de mídia
echo "Restaurando o volume 'adventurelog_media' a partir de $BACKUP_DIR/media_backup.tar..."
docker run --rm --volumes-from adventurelog-backend -v "$BACKUP_DIR":/backup ubuntu bash -c "cd /code/media && tar xvf /backup/media_backup.tar"

echo "Passo 4: Iniciando todos os serviços..."
docker-compose up -d

echo ""
echo "Importação concluída com sucesso!"
echo "A aplicação Adventure Log deve estar em execução com os dados restaurados."