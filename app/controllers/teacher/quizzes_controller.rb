class Teacher::QuizzesController < Teacher::TeacherController
  before_action :set_course, only: [:index, :new, :create]
  before_action :set_quiz, only: [:show, :edit, :update, :destroy]

  def index
    @quizzes = @course.quizzes.order(created_at: :desc)
  end

  def show
    @slides = @quiz.slides.order(:position, :created_at)
  end

  def new
    @quiz = @course.quizzes.new
  end

  def create
    @quiz = @course.quizzes.new(quiz_params)
    if @quiz.save
      redirect_to teacher_quiz_path(@quiz), notice: "Quiz was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @quiz.update(quiz_params)
      redirect_to teacher_quiz_path(@quiz), notice: "Quiz was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    course = @quiz.course
    @quiz.destroy
    redirect_to teacher_course_path(course), notice: "Quiz was successfully deleted.", status: :see_other
  end

  private

  def set_course
    @course = current_user.company.courses.find(params[:course_id])
  end

  def set_quiz
    @quiz = Quiz.joins(:course).where(courses: { company_id: current_user.company_id }).find(params[:id])
  end

  def quiz_params
    params.require(:quiz).permit(:title, :passing_score)
  end
end
