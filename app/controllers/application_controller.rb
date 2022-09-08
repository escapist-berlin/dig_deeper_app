class ApplicationController < ActionController::Base

  # Overwriting the sign_out redirect path method
   def after_sign_out_path_for(resource)
    root_path
   end
end
