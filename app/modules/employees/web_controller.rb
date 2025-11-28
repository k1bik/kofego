# typed: strict

module Employees
  class WebController < ApplicationController
    extend T::Sig

    sig { void }
    def index
      # add authorization
      render Employees::Index.new
    end
  end
end
