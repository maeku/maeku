source 'https://rubygems.org'

platforms :ruby do
  gem 'sqlite3', require: false
end

group :development, :test  do
  gem 'maeku_core', path: './core'
  gem 'maeku_editor', path: './editor'
end

group :development do
  gem 'pry'
  gem 'graphiql-rails'
end

gemspec
