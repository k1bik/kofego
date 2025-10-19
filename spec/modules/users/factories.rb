FactoryBot.define do
  factory :user, class: "Users::Record" do
    name { "Test user" }
    password { "password" }
    sequence(:email) { "test#{it}@example.com" }
  end
end
