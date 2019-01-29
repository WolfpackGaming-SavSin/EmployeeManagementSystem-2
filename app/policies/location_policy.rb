class LocationPolicy < ApplicationPolicy
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
    user.manager? or user.admin?
  end

  def permitted_attributes
    [:name, :address, :suite, :city, :state, :zip_code, :status]
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
