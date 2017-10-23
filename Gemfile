source 'https://rubygems.org'
ruby '2.3.1'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

###############################################################################
# Core
gem 'rails', '~> 5.1.3'
gem 'puma', '~> 3.7'
gem 'pg'                        # Database
gem 'jwt'                       # Token Auth
gem 'newrelic_rpm'
# Server
gem 'redis', '~> 3.0'
gem 'bcrypt', '~> 3.1.7'
gem 'graphql'

###############################################################################
# Content
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'turbolinks', '~> 5'


###############################################################################
# General
gem 'state_machines'
gem 'state_machines-activerecord'
gem 'elasticsearch-model'
gem 'elasticsearch-rails'
gem 'graphql'
gem 'smarter_csv'
gem 'sidekiq'


###############################################################################
# Attachments

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'faker'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
