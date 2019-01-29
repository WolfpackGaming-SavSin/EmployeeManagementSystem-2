class SecuritiesController < ApplicationController
  include Pundit

    before_action :find_security, only: [:edit, :update, :show, :destroy]

    def index
        @securities = Security.all #.paginate(page: params[:page], per_page: 10)
        authorize Security
    end

    def new
        @security = Security.new
        authorize @security
    end

    def create
        @security = Security.new(security_params)
        authorize @security
        if @security.save
            flash[:success] = "Security added successfully"
            redirect_to securities_path
        else
            render 'new'
        end
    end

    def edit
        authorize @security
    end

    def update
        authorize @security
        if @security.update(security_params)
            flash[:success] = "Security updated successfully"
            redirect_to security_path(@security)
        else
            render 'edit'
        end
    end

    def show
      authorize @security
    end

    def destroy
        authorize @security
        @security.destroy
        flash[:error] = "Security Type has been deleted"
        redirect_to securities_path
    end

    private
        def security_params
            params.require(:security).permit(:name, :description)
        end

        def find_security
            @security = Security.find(params[:id])
        end
end
