#!/bin/bash

# exit when any command fails
set -e

echo "[ * } DROPPING EXISTING TEST DATABASE"
mysql --user="${DB_USERNAME}" -h ${DB_HOST} --password="${DB_PASSWORD}" -e "DROP DATABASE IF EXISTS ${DB_NAME}; SHOW DATABASES;"

echo "[ * } CREATING FRESH TEST DATABASE"
mysql --user="${DB_USERNAME}" -h ${DB_HOST} --password="${DB_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME}; SHOW DATABASES;"

echo "[ * } LOADING TEST DATABASE TABLE STRUCTURE"
mysql --user="${DB_USERNAME}" -h ${DB_HOST} --password="${DB_PASSWORD}" -e "USE ${DB_NAME};SET GLOBAL FOREIGN_KEY_CHECKS=0;"
RAILS_ENV=test db/schema.rbbundle exec rake db:schema:load
mysql --user="${DB_USERNAME}" -h ${DB_HOST} --password="${DB_PASSWORD}" -e "USE ${DB_NAME};SET GLOBAL FOREIGN_KEY_CHECKS=1;"

echo "[ * } RUNNING ANY NEW DATABASE MIGRATIONS"
RAILS_ENV=test bundle exec rake db:migrate

echo "[ * } LOADING FIXTURES"
RAILS_ENV=test bundle exec rake db:fixtures:load

echo "[ * } SEEDING TEST DATABASE"
RAILS_ENV=test bundle exec rake db:seed

echo "[ * } FINISHED TEST DATABASE CLEANUP"
