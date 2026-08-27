class TeacherController < ApplicationController

before_action :authenticate_user! 
before_action :ensure_teacher!

def index
end


end