# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## Live website
https://cardmaestro.herokuapp.com

## Database creation
Install PostgreSQL from https://www.enterprisedb.com/downloads/postgres-postgresql-downloads

The one I used is version 12.0
## Database initialization

In psql.exe run:
```
create role cardmaestro with createdb login password 'Tornado-407';
ALTER USER cardmaestro WITH SUPERUSER;
```
In the project folder run:
```
bundle install
rails db:setup
rails db:migrate
```
## How to run the test suite
```
rake test
```

## Services (job queues, cache servers, search engines, etc.)
Devise: https://github.com/plataformatec/devise
## Deployment instructions
```
rails server
```
## Miscellaneous
### Setting up an initial administrator
+ Set up the user to be promoted to administrator in the users database (i.e. sign up for an account)
+ From the command prompt, run `rails db`
+ Enter password for cardmaestro `Tornado-407`
+ Determine the id of the user to promote. For example, enter `SELECT * FROM users;` and find the corresponding user and id 
+ Run `UPDATE users SET admin = true WHERE id = your_id;`, where `your_id` is the id of the user to promote
