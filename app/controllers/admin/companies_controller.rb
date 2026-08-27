class Admin::CompaniesController < Admin::AdminController

def index
  show_companies
end



def show_companies
  @companies = Company.all
end


end