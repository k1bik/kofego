# typed: strict

module Iam
  class RolesController < ApplicationController
    extend T::Sig

    sig { void }
    def index
      # add authorization
    end
  end
end
