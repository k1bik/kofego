require "rails_helper"

RSpec.describe Home::WebController, type: :controller do
  include_context :users_context

  describe "GET #index" do
    before { sign_in admin_user }

    it "returns a success response" do
      get :index

      expect(response).to be_successful
    end
  end
end
