
#!/bin/bash +x

export ENVIRONMENT_NAME=local
export DB_DIALECT=postgres
export DB_NAME=aurora_serverless_cluster_dev
export DB_HOST=localhost
export DB_USERNAME=admin_dev
export DB_PASSWORD=password
export DB_PORT=5432
export PGPASSWORD=password

psql -c "CREATE ROLE admin_dev LOGIN CREATEDB PASSWORD 'password';" 

npx sequelize db:create

psql -U admin_dev -c "GRANT ALL PRIVILEGES on DATABASE aurora_serverless_cluster_dev to admin_dev;"
psql -c "CREATE DATABASE aurora_serverless_cluster_dev;"

npx sequelize db:drop
npx sequelize db:create
npx sequelize db:migrate

