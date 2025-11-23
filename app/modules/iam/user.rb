# typed: strict

module Iam
  class User < ApplicationRecord
    extend Devise::Models
    extend T::Sig
    include StripAttributes

    self.table_name = :users

    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

    strip_attributes :name, :email

    belongs_to :role, class_name: "Iam::Role"

    validates :name, presence: true, length: { maximum: 255 }
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

    sig { returns(T::Boolean) }
    def admin?
      T.must(role).name == Iam::Role::ADMIN
    end
  end
end
