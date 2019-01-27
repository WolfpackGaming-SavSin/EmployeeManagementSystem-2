class LocationPolicy < ApplicationPolicy
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
