require 'pry'
require 'rspec'
require 'capybara/rspec'

require_relative 'support/database_cleaner'
require_relative '../app.rb'

require 'valid_attribute'
require 'shoulda/matchers'

set :environment, :test
set :database, :test

ActiveRecord::Base.logger.level = 1

Capybara.app = Sinatra::Application

RSpec.configure do |config|
  config.backtrace_exclusion_patterns << /.rubies/
  config.backtrace_exclusion_patterns << /.gem/

  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  config.order = :random
  Kernel.srand config.seed
end
