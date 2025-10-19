RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

require "./spec/modules/users/factories.rb"
