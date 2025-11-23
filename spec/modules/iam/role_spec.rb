require "rails_helper"

RSpec.describe Iam::Role, type: :model do
  subject { build(:role) }

  describe "associations" do
    it { should have_many(:users).class_name("Iam::User").with_foreign_key("role_id") }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(255) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  end

  describe "#strip_whitespace" do
    it "strips whitespace from the name before saving" do
      user = create(:role, name: " Test role ")

      expect(user.name).to eq("Test role")
    end
  end
end
