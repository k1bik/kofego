FactoryBot.define do
  factory :user, class: "Iam::User" do
    name { "Test user" }
    password { "password" }
    sequence(:email) { "test#{it}@example.com" }
  end
end
