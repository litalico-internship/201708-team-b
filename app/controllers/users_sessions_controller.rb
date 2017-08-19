class UsersSessionsController < Devise::SessionsController

  def after_sign_in_path_for(resource)
     if (session[:previous_url] == root_path)
        super
     else
        "auto_matches/show" || root_path
     end
  end 

end