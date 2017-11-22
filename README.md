# README

### Set up

if you're using [c9.io](https://c9.io/) and you want to upload it to heroku,
chances are you have a legacy version of  heroku-cli, to solve this, copy-paste 
the following in the terminal:

```sh
$ wget -qO- https://cli-assets.heroku.com/install-ubuntu.sh | sh
```
this should update the heroku-cli.

If you were using sqlite3, you must change it to postgresql in order to 
upload the app to heroku, first, in the gemfile, change `gem 'sqlite3'` 
to `gem 'pg'`, then run `bundle install`.

Now, you should change the file `config/database.yml`. Your file should look 
something like this:

```yml
default: &default
  adapter: postgresql
  encoding: unicode
  # For details on connection pooling, see rails configuration guide
  # http://guides.rubyonrails.org/configuring.html#database-pooling
  pool: 5

development:
  <<: *default
  database: my_database_development

test:
  <<: *default
  database: my_database_test

production:
  <<: *default
  database: my_database_production
```

now you should create the database and run any migrations you have:

```sh
$ rails db:create
$ rails db:migrate
```

If, after running the create command you get this error:

`PG::InvalidParameterValue: ERROR:  new encoding (UTF8) is incompatible with the encoding of the template database (SQL_ASCII)`

the solution is [here](https://stackoverflow.com/questions/16736891/pgerror-error-new-encoding-utf8-is-incompatible)
but I will copy the steps here in case the answers gets deleted, remember to run
this command first: `sudo -u postgres psql postgres`
	
>Ok, below steps resolved the problem:  
First, we need to drop template1. Templates can’t be dropped, so we first modify it so t’s an ordinary database:  
`UPDATE pg_database SET datistemplate = FALSE WHERE datname = 'template1';`  
Now we can drop it:  
`DROP DATABASE template1;`  
Now its time to create database from template0, with a new default encoding:  
`CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UNICODE';`  
Now modify template1 so it’s actually a template:  
`UPDATE pg_database SET datistemplate = TRUE WHERE datname = 'template1';`  
Now switch to template1 and VACUUM FREEZE the template:  
`\c template1`  
`VACUUM FREEZE;`  
Problem should be resolved.

To fill the database with data, run `rails db:seed`.
The seed data contains two users, three products with their category (as tags)
and twenty three categories, the credentials for the two users are:

email: el@admin.com 
password: 123456789

email: el@user.com 
password: 123456789

### API usage

All routes are prefixed with `/api/v1` except for the authentication routes,
the routes that require authentication need to be provided with the `uid`, 
`acces-token` and `client` headers.

# Authentication

## POST /auth/sign_in

Authenticates a user, requires `email` and `password` as params, returns the
headers needed in the authenticated routes

## DELETE /auth/sign_out

Ends the user's current session, requies authentication headers

## POST /auth

Creates a user, requires `email`, `password` and `password_confirmation` params, 
you can send a `confirm_success_url` to redirect the user to after the
confirmation link is pressed, this route will return the user as it was saved in
the database

# Products

## GET /products

returns all the products

## GET /products/last_ten

returns the last ten created products

## GET /products/by_category

returns all the products from one category, requires `category` param

## GET /users/:user_id/products

returns all the products from a user

## POST /users/:user_id/products

requires authentication, creates a product, requires `name`, `price`, `desc`, 
`rating`, `user_id`, `image` and `category_name`, returns the product with its id

## GET /users/:user_id/products/:id

returns a product from a user

## PATCH  /users/:user_id/products/:id

requires authentication, updates a product, requires the same params as post

## DELETE /users/:user_id/products/:id

requires authentication, deletes a product

# Users

## GET /users

returns all the users

## GET /users/:id

returns a single user

## PATCH  /users/:id

updates a user, requires `name` param

## DELETE /users/:id

requires authentication, deletes a user, only an admin can delete it

# Categories

## GET /categories

returns all the categories
