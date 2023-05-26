class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # ----- add these lines here: -----

  # Make the current_user method available to views also, not just controllers:
  helper_method :current_seller
  
  # Define the current_user method:
  def current_seller
    # Look up the current user based on user_id in the session cookie:
    @current_seller ||= Seller.find(session[:seller_id]) if session[:seller_id]
  end

  # ----- end of added lines -----
end
