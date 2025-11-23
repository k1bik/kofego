require "rails_helper"

RSpec.describe Users::Record, type: :model do
  include_context :users_context

  subject { admin_user }

  describe "associations" do
    it { should belong_to(:role).class_name("Users::Role").required }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(255) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }

    valid_emails = ["user@example.com", "user.name@example.co.uk", "user+tag@example.io", "u_s-e.r@example-domain.com",
      "user%mailbox@domain.com", "a@b.co", "USER@EXAMPLE.COM", "user..name@example.com", "user.@example.com",
      ".user@example.com", "  test@example.com "
    ]

    invalid_emails = [
      "userexample.com", "user@", "@example.com", "user@.example.com", "user@example..com", "user@exa_mple.com",
      "user@-example.com", "user@example-.com", "user@ example.com", "user@exämple.com"
    ]

    valid_emails.each { |email| it { is_expected.to allow_value(email).for(:email) } }
    invalid_emails.each { |email| it { is_expected.not_to allow_value(email).for(:email) } }
  end

  describe "#strip_whitespace" do
    it "strips whitespace from the name before saving" do
      user = create(:user, name: " Test user ", role: staff_role)

      expect(user.name).to eq("Test user")
    end

    it "strips whitespace from the email before saving" do
      user = create(:user, email: "  test@example.com ", role: staff_role)

      expect(user.email).to eq("test@example.com")
    end
  end
end
