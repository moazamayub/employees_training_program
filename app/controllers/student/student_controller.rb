class StudentController < ApplicationController

before_action :authenticate_user! 
before_action :ensure_student!


def index
  ensure_student!
end



def ensure_student!

  if current_user.role != "student" 
    redirect_to root_path  alert:"acess denied"
  end

end




end



