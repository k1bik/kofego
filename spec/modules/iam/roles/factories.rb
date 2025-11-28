FactoryBot.define do
  factory :role, class: "Iam::Roles::Record" do
    sequence(:name) { "role#{it}" }

    trait :admin do
      initialize_with { Iam::Roles::Record.find_or_create_by!(name: Iam::Roles::Record::ADMIN) }
    end

    trait :employee do
      initialize_with { Iam::Roles::Record.find_or_create_by!(name: Iam::Roles::Record::EMPLOYEE) }
    end
  end
end
