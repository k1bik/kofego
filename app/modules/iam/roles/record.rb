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
    before_destroy :ensure_not_system

    sig { returns(T::Boolean) }
    def system?
      system_type.present?
    end

    private

    sig { void }
    def ensure_not_system
      return unless system?

      throw(:abort)
    end
  end
end
