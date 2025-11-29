# typed: strict

module Iam::Roles
  class Record < ApplicationRecord
    extend T::Sig
    include StripAttributes

    self.table_name = :roles

    SYSTEM_TYPES = T.let([
      ADMIN = "admin",
      EMPLOYEE = "employee"
    ], T::Array[String])

    strip_attributes :name

    enum :system_type, SYSTEM_TYPES.index_with(&:itself)

    has_many :users, class_name: "Iam::User", foreign_key: :role_id

    validates :name, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }
    validates :system_type, inclusion: { in: SYSTEM_TYPES }, allow_nil: true
  end
end
