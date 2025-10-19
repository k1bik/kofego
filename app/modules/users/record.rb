# typed: strict

module Users
  class Record < ApplicationRecord
    extend Devise::Models
    extend T::Sig

    self.table_name = :users

    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

    before_save :strip_whitespace

    validates :name, presence: true, length: { maximum: 255 }
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

    private

    sig { void }
    def strip_whitespace
      return if name.blank?

      self.name = name.strip
    end
  end
end
