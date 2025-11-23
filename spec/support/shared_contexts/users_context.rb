RSpec.shared_context :users_context do
  # roles
  let!(:admin_role) { create(:role, :admin) }
  let!(:employee_role) { create(:role, :employee) }

  # users
  let!(:admin_user) { create(:user, role: admin_role) }
  let!(:employee_user) { create(:user, role: employee_role) }
end
