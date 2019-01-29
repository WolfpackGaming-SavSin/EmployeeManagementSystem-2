class PagesController < ApplicationController
  include Pundit

  before_action :authenticate_user!, :except => [:index]

  def index
  end

  def admin
    authorize :dashboard, :show?
    @employees = Employee.limit(5).order('updated_at desc')
    @locations = Location.limit(5).order('updated_at desc')
    @securities = Security.limit(5).order('updated_at desc')
    @programs = Program.limit(5).order('updated_at desc')
    @users = User.limit(5).order('updated_at desc')
  end
end
