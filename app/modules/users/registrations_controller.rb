# typed: strict

module Users
  class RegistrationsController < Devise::RegistrationsController
    extend T::Sig
    include Devise::Controllers::Helpers

    T.unsafe(self).before_action :configure_sign_up_params, only: [:create]

    protected

    sig { void }
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[name])
    end

    def build_resource(hash = {})
      super

      first_user = Users::Record.count.zero?

      resource.role =
        if first_user
          Users::Role.find_by!(name: Users::Role::ADMIN)
        else
          Users::Role.find_by!(name: Users::Role::STAFF)
        end
    end
  end
end
