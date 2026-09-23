class Teacher::SlideQuestionsController < Teacher::TeacherController
  before_action :set_slide, only: [:new, :create]
  before_action :set_slide_question, only: [:edit, :update, :destroy]

  OPTION_ROWS = 4

  def new
    @slide_question = @slide.slide_questions.new
    OPTION_ROWS.times { @slide_question.options.build }
  end

  def create
    @slide_question = @slide.slide_questions.new(slide_question_params)
    if @slide_question.save
      redirect_to teacher_slide_path(@slide), notice: "Question was successfully added."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @slide = @slide_question.slide
    extra_rows = OPTION_ROWS - @slide_question.options.size
    extra_rows.times { @slide_question.options.build } if extra_rows.positive?
  end

  def update
    if @slide_question.update(slide_question_params)
      redirect_to teacher_slide_path(@slide_question.slide), notice: "Question was successfully updated."
    else
      @slide = @slide_question.slide
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    slide = @slide_question.slide
    @slide_question.destroy
    redirect_to teacher_slide_path(slide), notice: "Question was successfully deleted.", status: :see_other
  end

  private

  def set_slide
    @slide = Slide.joins(quiz: :course).where(courses: { company_id: current_user.company_id }).find(params[:slide_id])
  end

  def set_slide_question
    @slide_question = SlideQuestion.joins(slide: { quiz: :course })
                                    .where(courses: { company_id: current_user.company_id })
                                    .find(params[:id])
  end

  def slide_question_params
    params.require(:slide_question).permit(
      :question_text, :question_type, :points,
      options_attributes: [:id, :option_text, :correct, :explanation, :_destroy]
    )
  end
end
