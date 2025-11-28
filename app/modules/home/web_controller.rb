# typed: strict

module Home
  class WebController < ApplicationController
    extend T::Sig

    sig { void }
    def index
      render Home::Index.new
    end
  end
end
