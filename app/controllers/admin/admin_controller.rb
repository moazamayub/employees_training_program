class Admin::AdminController < ApplicationController

before_action :authenticate_user! 
before_action :ensure_admin!

def index
  ensure_admin!
end



def ensure_admin!

  if current_user.role != "admin" 
    redirect_to root_path  alert:"acess denied"
  end

end







end