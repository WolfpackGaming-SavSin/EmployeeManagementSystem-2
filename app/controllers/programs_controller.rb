class ProgramsController < ApplicationController
  include Pundit

  before_action :find_program, only: [:edit, :update, :show, :destroy]

  def index
    authorize Program
    @programs = Program.paginate(page: params[:page], per_page: 10)
  end

  def new
    @program = Program.new
    authorize @program
  end

  def create
    @program = Program.new(permitted_attributes(Program))
    authorize @program
    if @program.save
      flash[:success] = "Application added successfully"
      redirect_to programs_path
    else
      render 'new'
    end
  end

  def edit
    authorize @program
  end

  def update
    authorize @program
    if @program.update(permitted_attributes(@program))
      flash[:success] = "Application updated successfully"
      redirect_to program_path(@program)
    else
      render 'edit'
    end
  end

  def show
    authorize @program
  end

  def destroy
    authorize @program
    @program.destroy
    flash[:error] = "Application Type has been deleted"
    redirect_to programs_path
  end

  private
    def find_program
      @program = Program.find(params[:id])
    end
end
