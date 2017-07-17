# OTRS Docker

## О проекте

Dockerfile и docker-compose для быстрого создания OTRS окружения на базе OTRS 5.0.20/Ubuntu:latest

## Структура проекта

### backups (нужно создать, или будет создана автоматически)

Папка в которой хранятся бейкапы OTRS и в которую вы можете их поместить для переноса настроек и базы в окружение

### mysql_config

Содержит кастомный my.cnf для mariadb(подробнее на https://hub.docker.com/_/mariadb/)

### docker-compose

файл композиции для развёртывания окружения Apache2 + OTRS + MariaDB одним действием

### Dockerfile

Файл для сборки образа со всем необходимым Apache 2 + OTRS

### db_container 

## Запуск (нужно создать, или будет создана автоматически)

Директория в которую Мария сохраняет таблицы, настройки и етц.

1. Соберите образ

```bash
docker build -t otrs_custom .
```

2. Запустите docker-compose

```bash
docker-compose up
```

Keroosha (´• ω •`) 17/06/2017