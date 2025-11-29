# typed: strict

module Iam::Roles
  class WebController < ApplicationController
    extend T::Sig

    sig { void }
    def index
      roles = Iam::Roles::Record.includes(:users).to_a

      render Iam::Roles::Index.new(roles:)
    end

    sig { void }
    def destroy
      role_id = params[:id]
      role = Iam::Roles::Record.includes(:users).find(role_id)

      if role.system? || role.users.any?
        return
      else
        role.destroy!

        flash.now[:notice] = t("success_notice")

        render turbo_stream: [
          turbo_stream.remove("role-row-#{role_id}"),
          turbo_stream.append(:flash, partial: "shared/flash")
        ]
      end
    end
  end
end
