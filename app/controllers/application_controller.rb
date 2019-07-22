class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    flash[:success] = "Hello, #{current_user.first_name}"
    resource.admin? ? admin_tests_path : root_path
   end
end
