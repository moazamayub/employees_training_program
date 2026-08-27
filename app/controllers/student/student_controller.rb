class StudentController < ApplicationController

before_action :authenticate_user! 
before_action :ensure_student!

def index
end



end