require 'pry'
require 'rspec'
require 'capybara/rspec'

require_relative '../app.rb'

set :environment, :test
set :database, :test

Capybara.app = Sinatra::Application
