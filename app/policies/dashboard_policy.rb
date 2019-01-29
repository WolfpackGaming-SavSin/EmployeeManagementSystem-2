class DashboardPolicy < Struct.new(:user, :dashboard)
  def show?
    user.manager? or user.admin?
  end
end
