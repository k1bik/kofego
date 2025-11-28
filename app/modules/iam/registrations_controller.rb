# typed: strict

module Iam
  class RegistrationsController < Devise::RegistrationsController
    extend T::Sig
    include Devise::Controllers::Helpers

    T.unsafe(self).before_action :configure_sign_up_params, only: [:create]

    protected

    sig { void }
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[name])
    end

    sig { params(hash: T.untyped).void }
    def build_resource(hash = {})
      super

      first_user = Iam::User.count.zero?

      resource.role =
        if first_user
          Iam::Roles::Record.find_by!(name: Iam::Roles::Record::ADMIN)
        else
          Iam::Roles::Record.find_by!(name: Iam::Roles::Record::EMPLOYEE)
        end
    end
  end
end
