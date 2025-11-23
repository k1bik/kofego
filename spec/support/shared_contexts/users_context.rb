RSpec.shared_context :users_context do
  # roles
  let!(:admin_role) { create(:role, :admin) }
  let!(:staff_role) { create(:role, :staff) }

  # users
  let!(:admin_user) { create(:user, role: admin_role) }
  let!(:staff_user) { create(:user, role: staff_role) }
end
