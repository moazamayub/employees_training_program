class Admin::UsersController < Admin::AdminController
  before_action :authenticate_user!
  before_action :set_company
  before_action :set_user, only: [:edit, :update, :destroy]

  ALLOWED_ROLES = %w[teacher student].freeze

  def index
    @users = @company.users.where(role: ALLOWED_ROLES).order(created_at: :desc)
  end

  def new
    @user = @company.users.new(role: "student")
  end

  def create
    @user = @company.users.new(user_params)
    if @user.save
      redirect_to admin_company_users_path(@company), notice: "#{@user.role.titleize} was successfully added."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_company_users_path(@company), notice: "#{@user.role.titleize} was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_company_users_path(@company), notice: "User was successfully removed.", status: :see_other
  end

  private

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_user
    @user = @company.users.find(params[:id])
  end

  def user_params
    permitted = params.require(:user).permit(:first_name, :last_name, :email, :role, :password, :password_confirmation)

    permitted[:role] = "student" unless ALLOWED_ROLES.include?(permitted[:role])
    permitted.delete(:password) if permitted[:password].blank?
    permitted.delete(:password_confirmation) if permitted[:password_confirmation].blank?

    permitted
  end
end
