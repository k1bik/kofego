FactoryBot.define do
  factory :user, class: "Iam::User" do
    name { "Test user" }
    password { "password" }
    sequence(:email) { "test#{it}@example.com" }
  end

  factory :role, class: "Iam::Role" do
    sequence(:name) { "role#{it}" }

    trait :admin do
      initialize_with { Iam::Role.find_or_create_by!(name: Iam::Role::ADMIN) }
    end

    trait :employee do
      initialize_with { Iam::Role.find_or_create_by!(name: Iam::Role::EMPLOYEE) }
    end
  end
end
