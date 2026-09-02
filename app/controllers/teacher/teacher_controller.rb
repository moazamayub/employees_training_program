class Teacher::TeacherController < ApplicationController

before_action :authenticate_user! 
before_action :ensure_teacher!

def index
  ensure_teacher!
end



def ensure_teacher!

  if current_user.role != "teacher" 
    redirect_to root_path  alert:"acess denied"
  end

end


end
