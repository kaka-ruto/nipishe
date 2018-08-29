source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.0'

# -------------------------------- #
# CORE
# Ruby on Rails
gem 'rails', '~> 5.2.1'

# ActiveRecord
gem 'pg', '>= 0.18', '< 2.0'
gem 'annotate'

# Use Puma as the app server
gem 'puma', '~> 3.11'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

# ------------------------------------- #
# FUNCTIONALITY
# Authentication and Authorization
gem 'devise'
gem 'pundit'

# API
gem 'graphql'
gem 'graphiql-rails'

# Factories
gem 'factory_bot_rails'
gem 'faker'

group :development, :test do
  # Debugging
  gem 'pry-rails'

  # Testing
  gem 'rspec-rails'

  # Coding-style
  gem 'rubocop'
  gem 'rubocop-rspec'
end

group :development do
  # Debugging
  gem 'better_errors'
  gem 'binding_of_caller'

  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Testing
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'rspec-graphql_matchers'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
