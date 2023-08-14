require 'dotenv/load'

Bundler.require(*Rails.groups)

if %w[development test].include? ENV['RAILS_ENV']
  Dotenv::Railtie.load
end
