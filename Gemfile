source "https://rubygems.org"

gem "rails", "~> 8.0.2", ">= 8.0.2.1"
gem "propshaft"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false
gem "tailwindcss-rails", "~> 4.3"
gem "sorbet-static-and-runtime"
gem "inline_svg"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "dotenv"
  gem "tapioca",  "~> 0.17", require: false
  gem "rspec-rails", "~> 8.0.0"
end

group :development do
  gem "web-console"
end

group :test do
  gem "rails-controller-testing"
end
