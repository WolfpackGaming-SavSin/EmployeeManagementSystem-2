class SecurityPolicy < ApplicationPolicy
  def index?
    user.admin? or user.manager?
  end

  def show?
    user.admin? or user.manager?
  end

  def create?
    user.admin?
  end

  def update?
   user.admin?
  end

  def destroy?
    user.admin?
  end

  def permitted_attributes
    if user.admin?
      [:name, :description, :status]
    end
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
