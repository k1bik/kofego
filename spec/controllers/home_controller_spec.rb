require "rails_helper"

RSpec.describe HomeController, type: :controller do
  let!(:user) { create(:user) }

  describe "GET #index" do
    before { sign_in user }

    it "returns a success response" do
      get :index

      expect(response).to be_successful
      expect(response).to render_template(:index)
    end
  end
end
