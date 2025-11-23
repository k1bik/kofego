# typed: strict

module Iam
  class Role < ApplicationRecord
    extend T::Sig
    include StripAttributes

    ADMIN = "admin"
    EMPLOYEE = "employee"

    self.table_name = :roles

    strip_attributes :name

    has_many :users, class_name: "Iam::User", foreign_key: :role_id

    validates :name, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }
  end
end
