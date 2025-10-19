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
  end
end
