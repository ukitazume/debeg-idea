ruby '2.1.1'

source 'https://rubygems.org'
source 'https://rails-assets.org'

gem 'rails', '5.0.0'
gem 'sass-rails', '~> 5.0.5'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.1'
gem 'jquery-rails', '>= 4.0.1'
gem 'turbolinks', '>= 2.2.2'
gem 'jbuilder', '~> 1.2'
gem 'haml-rails', '>= 0.5.3'
gem 'rails-assets-bootstrap'
gem 'erb2haml'
gem 'therubyracer'
gem 'omniauth', '>= 1.3.1'
gem 'omniauth-twitter', '>= 1.0.1'
gem 'newrelic_rpm'

group :development, :test do
  gem 'sqlite3'
  gem 'dotenv-rails'
  gem 'pry'
  gem 'pry-remote'
  gem 'pry-byebug'
  gem "binding_of_caller"
  gem 'meta_request', '>= 0.3.0'
  gem 'rspec-rails', '~> 3.0.0.0', github: 'rspec/rspec-rails'
  gem 'rspec-core', '~> 3.0.0.beta', github: 'rspec/rspec-core'
  gem 'rspec-expectations', '~> 3.0.0.beta', github: 'rspec/rspec-expectations'
  gem 'rspec-mocks', '~> 3.0.0.beta', github: 'rspec/rspec-mocks'
  gem 'rspec-support', '~> 3.0.0.beta', github: 'rspec/rspec-support'
  gem 'factory_girl_rails', '~> 4.4.1'
end

group :test do
  gem 'shoulda-matchers', '~> 2.6.0'
  gem 'capybara', '>= 2.2.1'
  gem 'poltergeist', '>= 1.5.0'
  gem 'database_rewinder'
  gem 'launchy'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
