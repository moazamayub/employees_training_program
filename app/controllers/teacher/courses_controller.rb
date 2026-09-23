class Teacher::CoursesController < Teacher::TeacherController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = current_user.company.courses.order(created_at: :desc)
  end

  def show
    @enrollments = @course.user_courses.includes(:user).order(:created_at)
    enrolled_ids = @enrollments.map(&:user_id)
    @available_students = current_user.company.users.where(role: "student").where.not(id: enrolled_ids)
  end

  def new
    @course = current_user.company.courses.new
  end

  def create
    @course = current_user.company.courses.new(course_params)
    @course.created_by = current_user
    if @course.save
      redirect_to teacher_course_path(@course), notice: "Course was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to teacher_course_path(@course), notice: "Course was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @course.destroy
    redirect_to teacher_courses_path, notice: "Course was successfully deleted.", status: :see_other
  end

  private

  def set_course
    @course = current_user.company.courses.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :description)
  end
end
