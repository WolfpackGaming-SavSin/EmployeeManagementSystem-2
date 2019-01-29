class EmployeePolicy < ApplicationPolicy
  def show?
    user.admin? or user.manager?
  end
  
  def create?
    user.admin?
  end

  def update?
    user.manager? or user.admin?
  end

  def destroy?
    user.admin?
  end

  def roster?
    user.user? or user.supervisor? or user.manager? or user.admin?
  end

  def disabled?
    user.manager? or user.admin?
  end

  def permitted_attributes
    [:first_name, :last_name, :username, :email, :ext, :direct_phone, :direct_fax, :dob, :job_title, :anniversary, :status, :manager_id, location_ids: [], security_ids: []]
  end

  class Scope < Scope
    def resolve
      scope.where(status: true)
    end
  end
end
