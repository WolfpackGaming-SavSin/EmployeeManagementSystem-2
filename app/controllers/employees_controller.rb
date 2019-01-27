class EmployeesController < ApplicationController
  include Pundit

  before_action :authenticate_user!
  before_action :find_employee, only: [:edit, :update, :show, :destroy]

  def index
    @employees = Employee.all
  end

  def roster
    authorize Employee
    @employees = Employee.where(status: true)
  end

  def disabled
    authorize Employee
    @employees = Employee.where(status: false)
  end

  def show
  end

  def new
    @employee = Employee.new
    authorize @employee
  end

  def create
    @employee = Employee.new(permitted_attributes(Employee))
    authorize @employee
    if @employee.save
      flash[:success] = "Employee, #{@employee.display_name} has been created"
      redirect_to employees_path
    else
      render 'new'
    end
  end

  def edit
    authorize @employee
  end

  def update
    authorize @employee
    if @employee.update(permitted_attributes(@employee))
      flash[:success] = "Employee Update Successful"
      redirect_to employee_path(@employee)
    else
      flash[:error] = "Something went wrong."
      render 'edit'
    end
  end

  def destroy
    authorize @employee
    @employee.destroy
    flash[:error] = "Employee has been deleted"
  end

  private
    def find_employee
      @employee = Employee.find(params[:id])
    end
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :username, :email, :ext, :direct_phone, :direct_fax, :dob, :job_title, :anniversary, :status)
    end
end
