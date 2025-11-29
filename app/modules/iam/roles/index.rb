# typed: strict

module Iam
  class Roles::Index < Ui::ApplicationComponent
    sig { params(roles: T::Array[Iam::Roles::Record]).void }
    def initialize(roles:)
      @roles = roles
    end
  end
end
