# typed: strict

module Iam::Roles
  class WebController < ApplicationController
    extend T::Sig

    sig { void }
    def index
      # add authorization
      render Iam::Roles::Index.new
    end
  end
end
