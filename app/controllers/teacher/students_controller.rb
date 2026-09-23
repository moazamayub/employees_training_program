class Teacher::StudentsController < Teacher::TeacherController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = current_user.company.users.where(role: "student").order(created_at: :desc)
  end

  def show
    @enrollments = @student.user_courses.includes(:course).order(:created_at)
  end

  def new
    @student = current_user.company.users.new(role: "student")
  end

  def create
    @student = current_user.company.users.new(student_params)
    @student.role = "student"
    if @student.save
      redirect_to teacher_student_path(@student), notice: "Student was successfully added."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @student.update(student_params)
      redirect_to teacher_student_path(@student), notice: "Student was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @student.destroy
    redirect_to teacher_students_path, notice: "Student was successfully removed.", status: :see_other
  end

  private

  def set_student
    @student = current_user.company.users.where(role: "student").find(params[:id])
  end

  def student_params
    permitted = params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    permitted.delete(:password) if permitted[:password].blank?
    permitted.delete(:password_confirmation) if permitted[:password_confirmation].blank?
    permitted
  end
end
