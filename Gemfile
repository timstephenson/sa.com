source 'https://rubygems.org'

ruby '2.1.10'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'bootstrap-sass', '~> 3.3.6'


# Use Unicorn as the app server
# gem 'unicorn'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
end

group :production do
  gem 'dragonfly-s3_data_store'
  gem 'rails_12factor'
  gem 'puma'
  gem 'fog-aws'
end


# Refinery CMS
gem 'refinerycms', '~> 3.0'

# Optionally, specify additional Refinery CMS Extensions here:
gem 'refinerycms-acts-as-indexed', ['~> 2.0', '>= 2.0.1']
gem 'refinerycms-wymeditor', ['~> 1.0', '>= 1.0.6']
gem 'refinerycms-authentication-devise', '~> 1.0'
#  gem 'refinerycms-blog', ['~> 3.0', '>= 3.0.0']
#  gem 'refinerycms-inquiries', ['~> 3.0', '>= 3.0.0']
#  gem 'refinerycms-search', ['~> 3.0', '>= 3.0.0']
#  gem 'refinerycms-page-images', ['~> 3.0', '>= 3.0.0']
