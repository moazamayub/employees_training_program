class Admin::CompaniesController < Admin::AdminController

 before_action :authenticate_user!
    
    before_action :set_company, only: [:show, :edit, :update, :destroy]

    def index
      @companies = Company.all.order(created_at: :desc)
    end

    def show
  
      @departments = @company.departments if @company.respond_to?(:departments)
      @users = @company.users if @company.respond_to?(:users)
    end

    def new
      @company = Company.new
    end

    def create
      @company = Company.new(company_params)
      if @company.save
        redirect_to admin_company_path(@company), notice: "Company was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @company.update(company_params)
        redirect_to admin_company_path(@company), notice: "Company was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @company.destroy
      redirect_to admin_companies_path, notice: "Company was successfully deleted.", status: :see_other
    end

    private

    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:name, :is_active)
    end


end

