class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, only: [:edit, :update, :show, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
    authorize @user
  end

  def create
    @user = User.new(permitted_attributes(User))
    authorize @user
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, :notice => 'User was successfully created.' }
        format.json { render :json => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    authorize @user
  end

  def update
    authorize @user
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    respond_to do |format|
      if @user.update_attributes(permitted_attributes(User))
        format.html { redirect_to @user, :notice => 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end


  private
    def user_params
      params.require(:user).permit(:username, :first_name, :last_name, :status, :role, :email, :password, :password_confirmation)
    end

    def find_user
      @user = User.find(params[:id])
    end
end
