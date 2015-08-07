# Heroku

## Setup

```
$ heroku login
$ heroku git:remote -a smp-foosball
$ heroku addons:create heroku-postgresql:hobby-dev
$ git subtree push --prefix api heroku master
```

## Deploy

```
$ heroku login
$ heroku git:remote -a smp-foosball
$ git push heroku `git subtree split --prefix api master`:master --force
```

## Database Migrations

```
$ heroku run rake db:migrate
```
