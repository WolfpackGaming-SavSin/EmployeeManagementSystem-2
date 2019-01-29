class PagesController < ApplicationController
  include Pundit

  before_action :authenticate_user!, :except => [:index]

  def index
  end

  def admin
    authorize :dashboard, :show?
  end
end
