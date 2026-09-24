class Teacher::EnrollmentsController < Teacher::TeacherController
  before_action :set_course

  def create
    student = current_user.company.users.where(role: "student").find(enrollment_params[:user_id])
    @course.user_courses.create(user: student, enrolled_at: Time.current)
    redirect_to teacher_course_path(@course), notice: "Student enrolled."
  end

  def destroy
    @course.user_courses.find(params[:id]).destroy
    redirect_to teacher_course_path(@course), notice: "Student unenrolled.", status: :see_other
  end

  private

  def set_course
    @course = current_user.company.courses.find(params[:course_id])
  end

  def enrollment_params
    params.require(:enrollment).permit(:user_id)
  end
end
