RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

require "./spec/modules/iam/factories.rb"
