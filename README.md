# davedkg-rails-plantmonitor

[![Maintainability](https://api.codeclimate.com/v1/badges/5c6146332180210c38c8/maintainability)](https://codeclimate.com/github/davedkg/davedkg-rails-plantmonitor/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/5c6146332180210c38c8/test_coverage)](https://codeclimate.com/github/davedkg/davedkg-rails-plantmonitor/test_coverage)
[![CircleCI](https://circleci.com/gh/davedkg/davedkg-rails-plantmonitor/tree/master.svg?style=shield)](https://circleci.com/gh/davedkg/davedkg-rails-plantmonitor/tree/master)

## Local Setup

```bash
brew install postgresql redis yarn imagemagick
bundle && yarn
cp .env.sample .env
bundle exec rake db:setup db:seed
rspec
foreman start -f Procfile.dev
open http://localhost:3000/
```

### Create First User

```bash
rails c
<pry> User.invite!(email: "bob@bob.com")
<pry> exit
tail -200 log/development.log
```

And then find the accept invitation link in the log.

### Custom Scaffold

Custom scaffold generates controller, model, policy, views with corresponding rspec files

```bash
rails g scaffold Object attribute1 attribute2
rails g pundit:policy Object
rails g request_specs Object
```

### Development Rake Tasks

| Task | Description |
| --- | --- |
| development:reset | Reset development and test databases, run development:seed, clear out tmp files |
| development:seed | Create seed data for development enviornment |
| acceptance:setup | Setup acceptance enviornment (see app.json) |
| acceptance:teardown | Tear down acceptance enviornment (see app.json) |
| cron:daily | Daily cron tasks |
| fix | Run Auto-correctors for Linters |
| lint | Run All Linters |

### Development Users

| Email | Password |
| --- | --- |
| user@example.com | users_password123 |
| admin@example.com | admins_password123 |

## Merge Template Updates

### Setup

```bash
git remote add template git@github.com:davedkg/davedkg-rails-template.git
```

### Merge

```bash
git pull template master --allow-unrelated-histories
```

## Deploy to Heroku

### Configuring

```bash
heroku buildpacks:add https://github.com/DuckyTeam/heroku-buildpack-imagemagick --index 1
heroku buildpacks:add heroku/ruby --index 2
heroku labs:enable runtime-dyno-metadata # Sentry Release Detection, HEROKU_APP_NAME
heroku config:set APP_DOMAIN www.example.com
```
