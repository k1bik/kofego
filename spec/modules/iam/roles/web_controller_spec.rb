require "rails_helper"

RSpec.describe Iam::Roles::WebController, type: :controller do
  include_context :users_context

  describe "GET #index" do
    before { sign_in admin_user }

    it "returns a success response" do
      get :index

      expect(response).to be_successful
    end
  end

  describe "DELETE #destroy" do
    before { sign_in admin_user }

    let!(:role) { create(:role) }
    let(:params) { { id: role.id } }

    it "deletes the role" do
      expect { delete :destroy, params: }.to change { Iam::Roles::Record.count }.by(-1)

      expect(response).to be_successful
      expect(flash[:notice]).to eq(I18n.t("success_notice"))
    end

    context "when the role is a system role" do
      let(:params) { { id: admin_role.id } }

      it "does not delete the role" do
        expect { delete :destroy, params: }.not_to change { Iam::Roles::Record.count }

        expect(response).to be_successful
      end
    end
  end
end
