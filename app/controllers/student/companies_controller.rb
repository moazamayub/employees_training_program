class Student::CompaniesController < Student::StudentController

def index
  show_companies
end



def show_companies
  @companies = Company.all
end


end