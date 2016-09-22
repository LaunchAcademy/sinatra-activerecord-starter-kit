# Sinatra Active Record Starter Kit

This template provides a basic [Sinatra](http://www.sinatrarb.com/) application
that includes:

- [Active Record](http://guides.rubyonrails.org/active_record_querying.html)
using [sinatra-activerecord](https://github.com/janko-m/sinatra-activerecord)
- [PostgreSQL](http://www.postgresql.org/) for a database
- [Sinatra::Reloader](http://www.sinatrarb.com/contrib/reloader.html) to
  automatically reload modified files during development
- [RSpec](https://github.com/rspec/rspec) for unit testing
- [Capybara](https://github.com/jnicklas/capybara) for acceptance testing
- [Pry](https://github.com/pry/pry) for debugging


## Getting Started

```no-highlight
# Clone down this template
git clone https://github.com/LaunchAcademy/sinatra-activerecord-starter-kit.git <YOUR_APP_NAME>

# Move into your app's directory
cd <YOUR_APP_NAME>

# Install all the gems
bundle install

# Remove the old git history and start your own
rm -rf .git && git init && git add -A && git commit -m 'Initial commit'
```

### Configuring Your Database

This template is set up for using a PostgreSQL database. You will need to create a
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

If you are having trouble with any of these commands, try prefixing them with `bundle exec`.

[Source](http://bundler.io/)

## Flash Notices

Uses [Sinatra Flash](https://github.com/SFEley/sinatra-flash)

Flash messages allow you to send information across page redirects. However, only short messages may be sent. Long messages or large objects tend to result in the Flash messages being cleared. In the `/app/views/layout.erb`, a message box for `flash[:notice]` has already been added.

**Example:**
```ruby
# app.rb

post '/books' do
  # do some logic like save something to the database
  flash[:notice] = "Your book was saved!"

  redirect '/books/all'
end

get '/books/all' do
  # Some code or logic to get all books

  erb :'books/index'
  # Flash message will appear on this page
end

# HEADS UP - flash does not work if returning a view
get '/books/all' do
  flash[:notice] = "This will not appear on the page."

  erb :'/books/index'
  # No flash message will appear until you navigate to a new page or the page refreshes.
end
```

## Shoulda Matchers

Uses [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers)

Shoulda Matchers allow for easier testing of Model associations in your unit tests using RSpec.

**Example:**

```ruby
# /spec/models/user_spec.rb

require 'spec_helper'
# In this example, a user can have many books,
# but may only belong to a single library.
describe User do
  it { should belong_to :library }
  it { should have_many :books }
end

```

```ruby
# /app/models/user.rb

class User < ActiveRecord::Base
  # Note the difference in "belongs_to" here vs. "belong_to" in the spec test.
  belongs_to :library
  has_many :books
end
```

## Valid Attribute

Uses [Valid Attribute](https://github.com/bcardarella/valid_attribute)

Valid Attribute allows for the rapid development of tests for validations
in your models.

**Example:**

```ruby
# /spec/models/user_spec.rb

describe User do
  it { should have_valid(:username).when("valid_username", "another_valid_username") }
  it { should_not have_valid(:username).when('', nil) }
end

```

```ruby
# /app/models/user.rb

class User < ActiveRecord::Base
  validates :username, presence: true
end
```
