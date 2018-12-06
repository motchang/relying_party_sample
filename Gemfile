# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'rails'

gem 'pg'

gem 'puma'

gem 'jbuilder'
gem 'sass-rails'
gem 'slim-rails'
gem 'turbolinks'
gem 'uglifier'
gem 'webpacker'

gem 'bootsnap', require: false

gem 'devise'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'factory_bot'
  gem 'listen'
  gem 'web-console'

  gem 'annotate', git: 'https://github.com/ctran/annotate_models.git', branch: 'develop'

  gem 'rubocop'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'chromedriver-helper'
  gem 'selenium-webdriver'

  gem 'rspec-rails'
  gem 'rspec_junit_formatter'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
