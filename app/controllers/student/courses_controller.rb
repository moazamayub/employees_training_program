class Student::CoursesController < Student::StudentController

def index
  show_courses
end



def show_courses
  @courses = Course.all
end


end