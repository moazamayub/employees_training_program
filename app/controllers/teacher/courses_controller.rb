class Teacher::CoursesController < Teacher::TeacherController

def index
  show_courses
end



def show_courses
  @courses = Course.all
end


end