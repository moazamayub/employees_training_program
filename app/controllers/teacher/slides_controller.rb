class Teacher::SlidesController < Teacher::TeacherController
  before_action :set_quiz, only: [:new, :create]
  before_action :set_slide, only: [:show, :edit, :update, :destroy]

  def show
    @slide_questions = @slide.slide_questions.includes(:options).order(:created_at)
  end

  def new
    @slide = @quiz.slides.new(position: next_position)
  end

  def create
    @slide = @quiz.slides.new(slide_params)
    if @slide.save
      redirect_to teacher_quiz_path(@quiz), notice: "Slide was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @slide.update(slide_params)
      redirect_to teacher_quiz_path(@slide.quiz), notice: "Slide was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    quiz = @slide.quiz
    @slide.destroy
    redirect_to teacher_quiz_path(quiz), notice: "Slide was successfully deleted.", status: :see_other
  end

  private

  def set_quiz
    @quiz = Quiz.joins(:course).where(courses: { company_id: current_user.company_id }).find(params[:quiz_id])
  end

  def set_slide
    @slide = Slide.joins(quiz: :course).where(courses: { company_id: current_user.company_id }).find(params[:id])
  end

  def next_position
    (@quiz.slides.maximum(:position) || 0) + 1
  end

  def slide_params
    params.require(:slide).permit(:title, :content, :position)
  end
end
