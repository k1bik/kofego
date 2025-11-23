FactoryBot.define do
  factory :user, class: "Users::Record" do
    name { "Test user" }
    password { "password" }
    sequence(:email) { "test#{it}@example.com" }
  end

  factory :role, class: "Users::Role" do
    sequence(:name) { "role#{it}" }

    trait :admin do
      initialize_with { Users::Role.find_or_create_by!(name: Users::Role::ADMIN) }
    end

    trait :staff do
      initialize_with { Users::Role.find_or_create_by!(name: Users::Role::STAFF) }
    end
  end
end
