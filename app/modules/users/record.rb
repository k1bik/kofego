# typed: strict

module Users
  class Record < ApplicationRecord
    extend Devise::Models
    extend T::Sig
    include StripAttributes

    self.table_name = :users

    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

    strip_attributes :name, :email

    belongs_to :role, class_name: "Users::Role"

    validates :name, presence: true, length: { maximum: 255 }
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  end
end
