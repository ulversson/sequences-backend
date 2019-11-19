class ApplicationController < ActionController::Base
def index
    redirect_to admin_root_path unless current_user
end    
end
