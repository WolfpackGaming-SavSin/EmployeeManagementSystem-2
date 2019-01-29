class ProgramPolicy < ApplicationPolicy
  def index?
    user.manager? or user.admin?
  end

  def show?
    user.manager? or user.admin?
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
    [:name, :description, :status]
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
