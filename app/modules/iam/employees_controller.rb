# typed: strict

module Iam
  class EmployeesController < ApplicationController
    extend T::Sig

    sig { void }
    def index
      # add authorization
    end
  end
end
