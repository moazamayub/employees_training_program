class HomeController < ApplicationController

  before_action :authenticate_user!

  def index
    if current_user&.admin?
      redirect_to admin_companies_path
    end


    if current_user&.student?
      redirect_to student_courses_path
    end


    if current_user&.teacher?
      redirect_to teacher_courses_path
    end

  
  end

end