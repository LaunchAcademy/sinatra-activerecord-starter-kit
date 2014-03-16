# Sinatra Active Record Starter Kit

This template provides a basic [sinatra](http://www.sinatrarb.com/) application
that includes:

- [Active Record](http://guides.rubyonrails.org/active_record_querying.html)
using [sinatra-activerecord](https://github.com/janko-m/sinatra-activerecord)
- [PostgreSQL](http://www.postgresql.org/) for a database
- [RSpec](https://github.com/rspec/rspec) for unit testing
- [Pry](https://github.com/pry/pry) for debugging

## Getting Started

```no-highlight
# Clone down this template
git clone --depth 1 git@github.com:LaunchAcademy/sinatra-activerecord-starter-kit.git <YOUR_APP_NAME>

# Move into your app's directory
cd <YOUR_APP_NAME>

# Install all the gems
bundle install
```

### Configuring Your Database

This template is set up for using a PostgreSQL database. You will need create a
`config/database.yml`. There is an example at `config/database.example.yml`.

Once you've created a `config/database.yml`, you can create your database with
`rake db:create`.

## Rake Tasks

This template uses the [sinatra-activerecord](https://github.com/janko-m/sinatra-activerecord)
gem, which provides the following rails-like rake tasks:

```no-highlight
rake db:create            # create the database from config/database.yml from the current Sinatra env
rake db:create_migration  # create an ActiveRecord migration
rake db:drop              # drops the data from config/database.yml from the current Sinatra env
rake db:migrate           # migrate the database (use version with VERSION=n)
rake db:rollback          # roll back the migration (use steps with STEP=n)
rake db:schema:dump       # dump schema into file
rake db:schema:load       # load schema into database
rake db:seed              # load the seed data from db/seeds.rb
rake db:setup             # create the database and load the schema
rake db:test:prepare      # Prepare test database from development schema
```

## Pushing to Github

Since your app  started as being a clone of this repository, you will
need to change your `origin` remote to point to your own Github repo before you
will be able to `push`. You can do this by using the `set-url` command.

```no-highlight
git remote set-url origin git@github.com:<YOUR_USERNAME>/<YOUR_REPO>.git
```
