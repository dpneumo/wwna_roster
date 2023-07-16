# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'rails', '~> 7.0.3'
gem 'pg'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'

gem 'jsbundling-rails'
gem "view_component"
gem "tailwindcss-rails", "~> 2.0"

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'

gem 'pagy', '~> 6'
gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'money-rails', '~>1.12'
gem 'devise'
gem 'rexml', '~> 3.2', '>= 3.2.4'

gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'web-console', '>= 4.2.0'
  gem 'pry-byebug'
  gem 'pry-rails'
#  gem 'spring'
#  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

