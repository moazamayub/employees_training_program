class Teacher::StudentsController < Teacher::TeacherController

def index
  show_users
end



def show_users
  User.where(role: :student)
end


end